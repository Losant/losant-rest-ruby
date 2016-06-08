# Access Tokens Actions

Details on the various actions that can be performed on the
Access Tokens resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the accessTokens for a user

```ruby
client.access_tokens.get
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [accessTokens](_schemas.md#accesstokens) | Collection of accessTokens |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new accessKey for a user

```ruby
client.access_tokens.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| accessToken | [accessToken](_schemas.md#accesstoken) | Y | AccessToken information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [accessToken](_schemas.md#accesstoken) | Successfully created access token |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
