use async_graphql::{EmptyMutation, EmptySubscription, Object, Schema, SimpleObject, ID};
use lazy_static::lazy_static;

use crate::scalars::Long;

lazy_static! {
    static ref PRODUCTS: Vec<Product> = vec![
        Product {
            upc: "1".to_string(),
            name: "Table".to_string(),
            price: Long(899),
            weight: Long(100),
        },
        Product {
            upc: "2".to_string(),
            name: "Couch".to_string(),
            price: Long(1299),
            weight: Long(1000),
        },
        Product {
            upc: "3".to_string(),
            name: "Glass".to_string(),
            price: Long(15),
            weight: Long(20),
        },
        Product {
            upc: "4".to_string(),
            name: "Chair".to_string(),
            price: Long(499),
            weight: Long(100),
        },
        Product {
            upc: "5".to_string(),
            name: "TV".to_string(),
            price: Long(1299),
            weight: Long(1000),
        },
        Product {
            upc: "6".to_string(),
            name: "Lamp".to_string(),
            price: Long(6999),
            weight: Long(300),
        },
        Product {
            upc: "7".to_string(),
            name: "Grill".to_string(),
            price: Long(3999),
            weight: Long(2000),
        },
        Product {
            upc: "8".to_string(),
            name: "Fridge".to_string(),
            price: Long(100000),
            weight: Long(6000),
        },
        Product {
            upc: "9".to_string(),
            name: "Sofa".to_string(),
            price: Long(9999),
            weight: Long(800),
        },
    ];
}

#[derive(SimpleObject, Clone)]
pub struct Product {
    upc: String,
    name: String,
    price: Long,
    weight: Long,
}

pub struct Query;

#[Object]
impl Query {
    async fn top_products(&self, #[graphql(default = 5)] first: i32) -> Vec<Product> {
        PRODUCTS.iter().take(first as usize).cloned().collect()
    }

    async fn product(&self, upc: ID) -> Option<Product> {
        PRODUCTS
            .iter()
            .find(|p| p.upc == upc.as_str())
            .cloned()
    }
}

pub type ProductsSchema = Schema<Query, EmptyMutation, EmptySubscription>;

pub fn schema() -> ProductsSchema {
    Schema::build(Query, EmptyMutation, EmptySubscription).finish()
}
