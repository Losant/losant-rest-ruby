# Applications

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the applications owned by the current user

```ruby
client.applications.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |
| orgId | string | N |  |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applications](_schemas.md#applications) | Collection of applications |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Post

Create a new application owned by the current user

```ruby
client.applications.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| application | [applicationPost](_schemas.md#applicationpost) | Y | New application information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [application](_schemas.md#application) | Successfully created application |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
