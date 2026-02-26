use async_graphql::{ObjectType, Request as GqlRequest, Schema, SubscriptionType, Variables};
use axum::body::Body;
use axum::http::{Response, StatusCode};

pub async fn handle_graphql<Q, M, S>(
    schema: Schema<Q, M, S>,
    body: String,
) -> Response<Body>
where
    Q: ObjectType + 'static,
    M: ObjectType + 'static,
    S: SubscriptionType + 'static,
{
    let json: serde_json::Value = match serde_json::from_str(&body) {
        Ok(v) => v,
        Err(e) => {
            return Response::builder()
                .status(StatusCode::BAD_REQUEST)
                .body(Body::from(format!("Invalid JSON: {}", e)))
                .unwrap();
        }
    };

    match &json {
        serde_json::Value::Array(requests) => {
            // Request batching: array of requests -> JSONL with requestIndex
            let mut lines = Vec::new();
            for (req_idx, req) in requests.iter().enumerate() {
                let query = req.get("query").and_then(|v| v.as_str()).unwrap_or("");
                let operation_name = req.get("operationName").and_then(|v| v.as_str());
                let variables = req.get("variables");

                match variables {
                    Some(serde_json::Value::Array(var_list)) => {
                        // Variable batching within request batch
                        for (var_idx, v) in var_list.iter().enumerate() {
                            let response =
                                execute_query(&schema, query, operation_name, Some(v)).await;
                            let mut json_val = serde_json::to_value(&response).unwrap();
                            if let Some(obj) = json_val.as_object_mut() {
                                obj.insert(
                                    "requestIndex".to_string(),
                                    serde_json::json!(req_idx),
                                );
                                obj.insert(
                                    "variableIndex".to_string(),
                                    serde_json::json!(var_idx),
                                );
                            }
                            lines.push(serde_json::to_string(&json_val).unwrap());
                        }
                    }
                    _ => {
                        let response =
                            execute_query(&schema, query, operation_name, variables).await;
                        let mut json_val = serde_json::to_value(&response).unwrap();
                        if let Some(obj) = json_val.as_object_mut() {
                            obj.insert(
                                "requestIndex".to_string(),
                                serde_json::json!(req_idx),
                            );
                        }
                        lines.push(serde_json::to_string(&json_val).unwrap());
                    }
                }
            }

            let mut body_out = lines.join("\n");
            body_out.push('\n');

            Response::builder()
                .header("content-type", "application/jsonl")
                .body(Body::from(body_out))
                .unwrap()
        }
        serde_json::Value::Object(req) => {
            let query = req.get("query").and_then(|v| v.as_str()).unwrap_or("");
            let operation_name = req.get("operationName").and_then(|v| v.as_str());
            let variables = req.get("variables");

            match variables {
                Some(serde_json::Value::Array(var_list)) => {
                    // Variable batching: variables as array -> JSONL with variableIndex
                    let mut lines = Vec::new();
                    for (var_idx, v) in var_list.iter().enumerate() {
                        let response =
                            execute_query(&schema, query, operation_name, Some(v)).await;
                        let mut json_val = serde_json::to_value(&response).unwrap();
                        if let Some(obj) = json_val.as_object_mut() {
                            obj.insert(
                                "variableIndex".to_string(),
                                serde_json::json!(var_idx),
                            );
                        }
                        lines.push(serde_json::to_string(&json_val).unwrap());
                    }

                    let mut body_out = lines.join("\n");
                    body_out.push('\n');

                    Response::builder()
                        .header("content-type", "application/jsonl")
                        .body(Body::from(body_out))
                        .unwrap()
                }
                _ => {
                    // Normal single request
                    let response =
                        execute_query(&schema, query, operation_name, variables).await;
                    let body_str = serde_json::to_string(&response).unwrap();

                    Response::builder()
                        .header("content-type", "application/json")
                        .body(Body::from(body_str))
                        .unwrap()
                }
            }
        }
        _ => Response::builder()
            .status(StatusCode::BAD_REQUEST)
            .body(Body::from("Request must be a JSON object or array"))
            .unwrap(),
    }
}

async fn execute_query<Q, M, S>(
    schema: &Schema<Q, M, S>,
    query: &str,
    operation_name: Option<&str>,
    variables: Option<&serde_json::Value>,
) -> async_graphql::Response
where
    Q: ObjectType + 'static,
    M: ObjectType + 'static,
    S: SubscriptionType + 'static,
{
    let mut request = GqlRequest::new(query);

    if let Some(op) = operation_name {
        request = request.operation_name(op);
    }

    if let Some(vars) = variables {
        if vars.is_object() {
            request = request.variables(Variables::from_json(vars.clone()));
        }
    }

    schema.execute(request).await
}
