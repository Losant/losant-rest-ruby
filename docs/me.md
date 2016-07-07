# Me Actions

Details on the various actions that can be performed on the
Me resource, including the expected
parameters and the potential responses.

##### Contents

*   [Add Recent Item](#add-recent-item)
*   [Delete](#delete)
*   [Disable Two Factor Auth](#disable-two-factor-auth)
*   [Disconnect Github](#disconnect-github)
*   [Disconnect Twitter](#disconnect-twitter)
*   [Enable Two Factor Auth](#enable-two-factor-auth)
*   [Fetch Recent Items](#fetch-recent-items)
*   [Get](#get)
*   [Patch](#patch)
*   [Verify Email](#verify-email)

<br/>

## Add Recent Item

Adds an item to a recent item list

```ruby
result = client.me.add_recent_item(data: my_data)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| data | [Recent Item](_schemas.md#recent-item) | Y | Object containing recent item info |  | [Recent Item Example](_schemas.md#recent-item-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](_schemas.md#recent-item-list) | Updated recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Delete

Deletes the current user

```ruby
result = client.me.delete(credentials: my_credentials)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| credentials | [User Credentials](_schemas.md#user-credentials) | Y | User authentication credentials |  | [User Credentials Example](_schemas.md#user-credentials-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If the user was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Disable Two Factor Auth

Disables two factor auth for the current user

```ruby
result = client.me.disable_two_factor_auth(data: my_data)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| data | [Disable Two Factor Auth](_schemas.md#disable-two-factor-auth) | Y | Object containing two factor auth properties |  | [Disable Two Factor Auth Example](_schemas.md#disable-two-factor-auth-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Github

Disconnects the user from Github

```ruby
result = client.me.disconnect_github(optional_params)

puts result
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Twitter

Disconnects the user from Twitter

```ruby
result = client.me.disconnect_twitter(optional_params)

puts result
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Enable Two Factor Auth

Enables two factor auth for the current user

```ruby
result = client.me.enable_two_factor_auth(data: my_data)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| data | [Enable Two Factor Auth](_schemas.md#enable-two-factor-auth) | Y | Object containing two factor auth properties |  | [Enable Two Factor Auth Example](_schemas.md#enable-two-factor-auth-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Fetch Recent Items

Gets a recent item list

```ruby
result = client.me.fetch_recent_items(itemType: my_item_type)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| parentId | string | N | Parent id of the recent list |  | 575ec8687ae143cd83dc4a97 |
| itemType | undefined | Y | Item type to get the recent list of. Accepted values are: application, device, flow, dashboard |  | application |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](_schemas.md#recent-item-list) | Recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Get

Retrieves information on the current user

```ruby
result = client.me.get(optional_params)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| includeRecent | undefined | N | Should the user include recent app/dashboard info |  | true |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Current user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Patch

Updates information about the current user

```ruby
result = client.me.patch(user: my_user)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| user | [Me Patch](_schemas.md#me-patch) | Y | Object containing new user properties |  | [Me Patch Example](_schemas.md#me-patch-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](_schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Verify Email

Sends an email verification to the user

```ruby
result = client.me.verify_email(optional_params)

puts result
```

#### Available Parameters

No parameters needed for this call.

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If email verification was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
