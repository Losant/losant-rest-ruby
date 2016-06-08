# Me

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Verify Email](#verify-email)
*   [Enable Two Factor Auth](#enable-two-factor-auth)
*   [Disable Two Factor Auth](#disable-two-factor-auth)
*   [Disconnect Github](#disconnect-github)
*   [Disconnect Twitter](#disconnect-twitter)
*   [Add Recent Item](#add-recent-item)
*   [Fetch Recent Items](#fetch-recent-items)

### Get

Retrieves information on the current user

```ruby
client.me.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| includeRecent | undefined | N | Should the user include recent app/dashboard info |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Current user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Patch

Updates information about the current user

```ruby
client.me.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| user | [mePatch](_schemas.md#mepatch) | Y | Object containing new user properties |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Delete

Deletes the current user

```ruby
client.me.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| credentials | [userCredentials](_schemas.md#usercredentials) | Y | User authentication credentials |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If the user was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Verify Email

Sends and email verification to the user

```ruby
client.me.verify_email
```

#### Parameters

No parameters needed for this call.

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If email verification was successfully sent |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Enable Two Factor Auth

Enables two factor auth for the current user

```ruby
client.me.enable_two_factor_auth(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| data | [enableTwoFactorAuth](_schemas.md#enabletwofactorauth) | Y | Object containing two factor auth properties |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Disable Two Factor Auth

Disables two factor auth for the current user

```ruby
client.me.disable_two_factor_auth(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| data | [disableTwoFactorAuth](_schemas.md#disabletwofactorauth) | Y | Object containing two factor auth properties |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Disconnect Github

Disconnects the user from Github

```ruby
client.me.disconnect_github
```

#### Parameters

No parameters needed for this call.

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Disconnect Twitter

Disconnects the user from Twitter

```ruby
client.me.disconnect_twitter
```

#### Parameters

No parameters needed for this call.

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Add Recent Item

Adds an item to a recent item list

```ruby
client.me.add_recent_item(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| data | [recentItem](_schemas.md#recentitem) | Y | Object containing recent item info |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [recentItemList](_schemas.md#recentitemlist) | Updated recent item list |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

### Fetch Recent Items

Gets a recent item list

```ruby
client.me.fetch_recent_items(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| parentId | string | N | undefined |
| itemType | undefined | N | undefined |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [recentItemList](_schemas.md#recentitemlist) | Recent item list |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
