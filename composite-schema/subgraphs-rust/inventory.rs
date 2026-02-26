use async_graphql::{
    ComplexObject, EmptyMutation, EmptySubscription, Object, Schema, SimpleObject, ID,
};
use lazy_static::lazy_static;

use crate::scalars::Long;

struct ProductData {
    upc: String,
    in_stock: bool,
}

lazy_static! {
    static ref INVENTORY: Vec<ProductData> = vec![
        ProductData { upc: "1".to_string(), in_stock: true },
        ProductData { upc: "2".to_string(), in_stock: false },
        ProductData { upc: "3".to_string(), in_stock: false },
        ProductData { upc: "4".to_string(), in_stock: false },
        ProductData { upc: "5".to_string(), in_stock: true },
        ProductData { upc: "6".to_string(), in_stock: true },
        ProductData { upc: "7".to_string(), in_stock: true },
        ProductData { upc: "8".to_string(), in_stock: false },
        ProductData { upc: "9".to_string(), in_stock: true },
    ];
}

#[derive(SimpleObject, Clone)]
#[graphql(complex)]
pub struct Product {
    upc: String,
    in_stock: bool,
}

#[ComplexObject]
impl Product {
    async fn shipping_estimate(&self, weight: Long, price: Long) -> Option<Long> {
        if price.0 > 1000 {
            Some(Long(0))
        } else {
            Some(Long(weight.0 / 2))
        }
    }
}

pub struct Query;

#[Object]
impl Query {
    async fn product_by_upc(&self, upc: ID) -> Option<Product> {
        INVENTORY
            .iter()
            .find(|p| p.upc == upc.as_str())
            .map(|p| Product {
                upc: p.upc.clone(),
                in_stock: p.in_stock,
            })
    }
}

pub type InventorySchema = Schema<Query, EmptyMutation, EmptySubscription>;

pub fn schema() -> InventorySchema {
    Schema::build(Query, EmptyMutation, EmptySubscription).finish()
}
