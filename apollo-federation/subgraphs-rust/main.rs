use async_graphql_axum::GraphQL;
use axum::{
    extract::Request,
    middleware::{self, Next},
    response::Response,
    routing::post_service,
    Router,
};
use std::env::var;
use tokio::net::TcpListener;

mod accounts;
mod inventory;
mod products;
mod reviews;

extern crate lazy_static;

async fn delay_middleware(req: Request, next: Next) -> Response {
    let delay_ms: Option<u64> = std::env::var("SUBGRAPH_DELAY_MS")
        .ok()
        .and_then(|s| s.parse().ok())
        .filter(|d| *d != 0);

    if let Some(delay_ms) = delay_ms {
        tokio::time::sleep(tokio::time::Duration::from_millis(delay_ms)).await;
    }

    next.run(req).await
}

#[tokio::main]
async fn main() {
    let host = var("HOST").unwrap_or("0.0.0.0".to_owned());
    let accounts_port = var("ACCOUNTS_PORT")
        .or_else(|_| var("PORT"))
        .unwrap_or("5221".to_owned());
    let inventory_port = var("INVENTORY_PORT").unwrap_or("5222".to_owned());
    let products_port = var("PRODUCTS_PORT").unwrap_or("5223".to_owned());
    let reviews_port = var("REVIEWS_PORT").unwrap_or("5224".to_owned());

    let accounts_app = Router::new()
        .route(
            "/graphql",
            post_service(GraphQL::new(accounts::get_subgraph())),
        )
        .route("/health", axum::routing::get(|| async { "OK" }))
        .route_layer(middleware::from_fn(delay_middleware));

    let inventory_app = Router::new()
        .route(
            "/graphql",
            post_service(GraphQL::new(inventory::get_subgraph())),
        )
        .route("/health", axum::routing::get(|| async { "OK" }))
        .route_layer(middleware::from_fn(delay_middleware));

    let products_app = Router::new()
        .route(
            "/graphql",
            post_service(GraphQL::new(products::get_subgraph())),
        )
        .route("/health", axum::routing::get(|| async { "OK" }))
        .route_layer(middleware::from_fn(delay_middleware));

    let reviews_app = Router::new()
        .route(
            "/graphql",
            post_service(GraphQL::new(reviews::get_subgraph())),
        )
        .route("/health", axum::routing::get(|| async { "OK" }))
        .route_layer(middleware::from_fn(delay_middleware));

    println!("Starting accounts subgraph on http://localhost:{accounts_port}/graphql");
    println!("Starting inventory subgraph on http://localhost:{inventory_port}/graphql");
    println!("Starting products subgraph on http://localhost:{products_port}/graphql");
    println!("Starting reviews subgraph on http://localhost:{reviews_port}/graphql");

    let accounts_server = axum::serve(
        TcpListener::bind(format!("{host}:{accounts_port}"))
            .await
            .unwrap(),
        accounts_app,
    );
    let inventory_server = axum::serve(
        TcpListener::bind(format!("{host}:{inventory_port}"))
            .await
            .unwrap(),
        inventory_app,
    );
    let products_server = axum::serve(
        TcpListener::bind(format!("{host}:{products_port}"))
            .await
            .unwrap(),
        products_app,
    );
    let reviews_server = axum::serve(
        TcpListener::bind(format!("{host}:{reviews_port}"))
            .await
            .unwrap(),
        reviews_app,
    );

    tokio::try_join!(
        accounts_server,
        inventory_server,
        products_server,
        reviews_server
    )
    .unwrap();
}
