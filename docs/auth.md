# Auth

## Actions

*   [Authenticate User](#authenticate-user)
*   [Authenticate User Github](#authenticate-user-github)
*   [Authenticate Device](#authenticate-device)

### Authenticate User

Authenticates a user using the provided credentials

```ruby
client.auth.authenticate_user(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| credentials | [userCredentials](_schemas.md#usercredentials) | Y | User authentication credentials |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedUser](_schemas.md#autheduser) | Successful authentication |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |

### Authenticate User Github

Authenticates a user via GitHub OAuth

```ruby
client.auth.authenticate_user_github(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| oauth | [githubLogin](_schemas.md#githublogin) | Y | User authentication credentials (access token) |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedUser](_schemas.md#autheduser) | Successful authentication |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |

### Authenticate Device

Authenticates a device using the provided credentials

```ruby
client.auth.authenticate_device(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| credentials | [deviceCredentials](_schemas.md#devicecredentials) | Y | Device authentication credentials |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedDevice](_schemas.md#autheddevice) | Successful authentication |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |
