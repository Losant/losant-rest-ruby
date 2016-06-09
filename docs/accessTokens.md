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
| 200 | [Access Tokens](_schemas.md#access-tokens) | Collection of accessTokens |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new accessKey for a user

```ruby
client.access_tokens.post(
  accessToken: my_access_token
)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| accessToken | [Access Token Post](_schemas.md#access-token-post) | Y | AccessToken information |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Access Token](_schemas.md#access-token) | Successfully created access token |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
