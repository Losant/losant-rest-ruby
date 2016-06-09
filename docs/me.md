# Me Actions

Details on the various actions that can be performed on the
Me resource, including the expected
parameters and the potential responses.

##### Contents

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

<br/>

## Get

Retrieves information on the current user

```ruby
client.me.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| includeRecent | undefined | N | Should the user include recent app/dashboard info |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Current user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Patch

Updates information about the current user

```ruby
client.me.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| user | [mePatch](_schemas.md#mepatch) | Y | Object containing new user properties |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Delete

Deletes the current user

```ruby
client.me.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| credentials | [userCredentials](_schemas.md#usercredentials) | Y | User authentication credentials |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If the user was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Verify Email

Sends and email verification to the user

```ruby
client.me.verify_email
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If email verification was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Enable Two Factor Auth

Enables two factor auth for the current user

```ruby
client.me.enable_two_factor_auth(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| data | [enableTwoFactorAuth](_schemas.md#enabletwofactorauth) | Y | Object containing two factor auth properties |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Disable Two Factor Auth

Disables two factor auth for the current user

```ruby
client.me.disable_two_factor_auth(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| data | [disableTwoFactorAuth](_schemas.md#disabletwofactorauth) | Y | Object containing two factor auth properties |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Github

Disconnects the user from Github

```ruby
client.me.disconnect_github
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Twitter

Disconnects the user from Twitter

```ruby
client.me.disconnect_twitter
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Add Recent Item

Adds an item to a recent item list

```ruby
client.me.add_recent_item(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| data | [recentItem](_schemas.md#recentitem) | Y | Object containing recent item info |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [recentItemList](_schemas.md#recentitemlist) | Updated recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |

<br/>

## Fetch Recent Items

Gets a recent item list

```ruby
client.me.fetch_recent_items(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| parentId | string | N | Parent id of the recent list |  |
| itemType | One of: application, device, flow, dashboard | Y | Item type to get the recent list of |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [recentItemList](_schemas.md#recentitemlist) | Recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
