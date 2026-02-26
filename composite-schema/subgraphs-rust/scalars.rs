use async_graphql::{InputValueError, InputValueResult, Scalar, ScalarType, Value};

#[derive(Clone, Copy, Debug)]
pub struct Long(pub i64);

#[Scalar]
impl ScalarType for Long {
    fn parse(value: Value) -> InputValueResult<Self> {
        if let Value::Number(n) = &value {
            if let Some(i) = n.as_i64() {
                return Ok(Long(i));
            }
        }
        Err(InputValueError::expected_type(value))
    }

    fn to_value(&self) -> Value {
        Value::Number(serde_json::Number::from(self.0))
    }
}
