# Applications Actions

Details on the various actions that can be performed on the
Applications resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the applications owned by the current user

```ruby
client.applications.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |
| orgId | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applications](_schemas.md#applications) | Collection of applications |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new application owned by the current user

```ruby
client.applications.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| application | [applicationPost](_schemas.md#applicationpost) | Y | New application information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [application](_schemas.md#application) | Successfully created application |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
