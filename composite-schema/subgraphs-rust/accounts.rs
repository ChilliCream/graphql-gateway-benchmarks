use async_graphql::{EmptyMutation, EmptySubscription, Object, Schema, SimpleObject, ID};
use lazy_static::lazy_static;

lazy_static! {
    static ref USERS: Vec<User> = vec![
        User {
            id: ID("1".to_string()),
            name: Some("Uri Goldshtein".to_string()),
            username: Some("urigo".to_string()),
            birthday: Some(1234567890),
        },
        User {
            id: ID("2".to_string()),
            name: Some("Dotan Simha".to_string()),
            username: Some("dotansimha".to_string()),
            birthday: Some(1234567890),
        },
        User {
            id: ID("3".to_string()),
            name: Some("Kamil Kisiela".to_string()),
            username: Some("kamilkisiela".to_string()),
            birthday: Some(1234567890),
        },
        User {
            id: ID("4".to_string()),
            name: Some("Arda Tanrikulu".to_string()),
            username: Some("ardatan".to_string()),
            birthday: Some(1234567890),
        },
        User {
            id: ID("5".to_string()),
            name: Some("Gil Gardosh".to_string()),
            username: Some("gilgardosh".to_string()),
            birthday: Some(1234567890),
        },
        User {
            id: ID("6".to_string()),
            name: Some("Laurin Quast".to_string()),
            username: Some("laurin".to_string()),
            birthday: Some(1234567890),
        },
    ];
}

#[derive(SimpleObject, Clone)]
pub struct User {
    id: ID,
    name: Option<String>,
    username: Option<String>,
    birthday: Option<i32>,
}

pub struct Query;

#[Object]
impl Query {
    async fn me(&self) -> Option<User> {
        Some(USERS[0].clone())
    }

    async fn user(&self, id: ID) -> Option<User> {
        USERS.iter().find(|u| u.id == id).cloned()
    }

    async fn users(&self) -> Vec<User> {
        USERS.clone()
    }
}

pub type AccountsSchema = Schema<Query, EmptyMutation, EmptySubscription>;

pub fn schema() -> AccountsSchema {
    Schema::build(Query, EmptyMutation, EmptySubscription).finish()
}
