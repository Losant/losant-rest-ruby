# Access Token Actions

Details on the various actions that can be performed on the
Access Token resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

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
| 200 | [accessToken](_schemas.md#accesstoken) | Device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |

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
| accessToken | [accessTokenPatch](_schemas.md#accesstokenpatch) | Y | Object containing new properties of the accessToken |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [accessToken](_schemas.md#accesstoken) | Updated accessToken information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |

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
| 200 | [success](_schemas.md#success) | If accessToken was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if accessToken was not found |
