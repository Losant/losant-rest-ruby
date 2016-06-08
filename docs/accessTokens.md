# Access Tokens

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the accessTokens for a user

```ruby
client.access_tokens.get
```

#### Parameters

No parameters needed for this call.

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [accessTokens](_schemas.md#accesstokens) | Collection of accessTokens |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Post

Create a new accessKey for a user

```ruby
client.access_tokens.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| accessToken | [accessToken](_schemas.md#accesstoken) | Y | AccessToken information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [accessToken](_schemas.md#accesstoken) | Successfully created access token |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
