# Auth Actions

Details on the various actions that can be performed on the
Auth resource, including the expected
parameters and the potential responses.

##### Contents

*   [Authenticate User](#authenticate-user)
*   [Authenticate User Github](#authenticate-user-github)
*   [Authenticate Device](#authenticate-device)

<br/>

## Authenticate User

Authenticates a user using the provided credentials

```ruby
client.auth.authenticate_user(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| credentials | [userCredentials](_schemas.md#usercredentials) | Y | User authentication credentials |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedUser](_schemas.md#autheduser) | Successful authentication |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |

<br/>

## Authenticate User Github

Authenticates a user via GitHub OAuth

```ruby
client.auth.authenticate_user_github(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| oauth | [githubLogin](_schemas.md#githublogin) | Y | User authentication credentials (access token) |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedUser](_schemas.md#autheduser) | Successful authentication |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |

<br/>

## Authenticate Device

Authenticates a device using the provided credentials

```ruby
client.auth.authenticate_device(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| credentials | [deviceCredentials](_schemas.md#devicecredentials) | Y | Device authentication credentials |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [authedDevice](_schemas.md#autheddevice) | Successful authentication |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 401 | [error](_schemas.md#error) | Unauthorized error if authentication fails |
