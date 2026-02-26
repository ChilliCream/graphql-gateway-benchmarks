use axum::{
    body::Body,
    extract::{Request, State},
    http::Response,
    middleware::{self, Next},
    routing::{get, post},
    Router,
};
use std::env::var;
use tokio::net::TcpListener;

mod accounts;
mod handler;
mod inventory;
mod products;
mod reviews;
mod scalars;

extern crate lazy_static;

async fn delay_middleware(req: Request, next: Next) -> axum::response::Response {
    let delay_ms: Option<u64> = std::env::var("SUBGRAPH_DELAY_MS")
        .ok()
        .and_then(|s| s.parse().ok())
        .filter(|d| *d != 0);

    if let Some(delay_ms) = delay_ms {
        tokio::time::sleep(tokio::time::Duration::from_millis(delay_ms)).await;
    }

    next.run(req).await
}

async fn accounts_handler(
    State(schema): State<accounts::AccountsSchema>,
    body: String,
) -> Response<Body> {
    handler::handle_graphql(schema, body).await
}

async fn inventory_handler(
    State(schema): State<inventory::InventorySchema>,
    body: String,
) -> Response<Body> {
    handler::handle_graphql(schema, body).await
}

async fn products_handler(
    State(schema): State<products::ProductsSchema>,
    body: String,
) -> Response<Body> {
    handler::handle_graphql(schema, body).await
}

async fn reviews_handler(
    State(schema): State<reviews::ReviewsSchema>,
    body: String,
) -> Response<Body> {
    handler::handle_graphql(schema, body).await
}

#[tokio::main]
async fn main() {
    let host = var("HOST").unwrap_or("0.0.0.0".to_owned());

    let accounts_app = Router::new()
        .route("/graphql", post(accounts_handler))
        .route("/health", get(|| async { "OK" }))
        .with_state(accounts::schema())
        .layer(middleware::from_fn(delay_middleware));

    let inventory_app = Router::new()
        .route("/graphql", post(inventory_handler))
        .route("/health", get(|| async { "OK" }))
        .with_state(inventory::schema())
        .layer(middleware::from_fn(delay_middleware));

    let products_app = Router::new()
        .route("/graphql", post(products_handler))
        .route("/health", get(|| async { "OK" }))
        .with_state(products::schema())
        .layer(middleware::from_fn(delay_middleware));

    let reviews_app = Router::new()
        .route("/graphql", post(reviews_handler))
        .route("/health", get(|| async { "OK" }))
        .with_state(reviews::schema())
        .layer(middleware::from_fn(delay_middleware));

    println!("Starting composite-schema subgraphs...");
    println!("  Accounts:  http://{}:5221/graphql", host);
    println!("  Inventory: http://{}:5222/graphql", host);
    println!("  Products:  http://{}:5223/graphql", host);
    println!("  Reviews:   http://{}:5224/graphql", host);

    tokio::try_join!(
        axum::serve(
            TcpListener::bind(format!("{}:5221", host)).await.unwrap(),
            accounts_app,
        ),
        axum::serve(
            TcpListener::bind(format!("{}:5222", host)).await.unwrap(),
            inventory_app,
        ),
        axum::serve(
            TcpListener::bind(format!("{}:5223", host)).await.unwrap(),
            products_app,
        ),
        axum::serve(
            TcpListener::bind(format!("{}:5224", host)).await.unwrap(),
            reviews_app,
        ),
    )
    .unwrap();
}
