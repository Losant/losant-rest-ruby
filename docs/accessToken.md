# Access Token

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

### Get

Retrieves information on an accessToken

```ruby
client.access_token.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| accessTokenId | string | Y | ID associated with the accessToken |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [accessToken](_schemas.md#accesstoken) | Device information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |

### Patch

Updates information about a accessToken

```ruby
client.access_token.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| accessTokenId | string | Y | ID associated with the accessToken |
| accessToken | [accessTokenPatch](_schemas.md#accesstokenpatch) | Y | Object containing new properties of the accessToken |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [accessToken](_schemas.md#accesstoken) | Updated accessToken information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |

### Delete

Deletes a accessToken

```ruby
client.access_token.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| accessTokenId | string | Y | ID associated with the accessToken |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If accessToken was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |
