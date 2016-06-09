# Access Token Actions

Details on the various actions that can be performed on the
Access Token resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Patch](#patch)

<br/>

## Delete

Deletes a accessToken

```ruby
client.access_token.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| accessTokenId | string | Y | ID associated with the accessToken |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If accessToken was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if accessToken was not found |

<br/>

## Get

Retrieves information on an accessToken

```ruby
client.access_token.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| accessTokenId | string | Y | ID associated with the accessToken |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Access Token](_schemas.md#access-token) | Device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if accessToken was not found |

<br/>

## Patch

Updates information about a accessToken

```ruby
client.access_token.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| accessTokenId | string | Y | ID associated with the accessToken |  |
| accessToken | [Access Token Patch](_schemas.md#access-token-patch) | Y | Object containing new properties of the accessToken |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Access Token](_schemas.md#access-token) | Updated accessToken information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if accessToken was not found |
