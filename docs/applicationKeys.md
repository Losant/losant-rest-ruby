# Application Keys

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the applicationKeys for an application

```ruby
client.application_keys.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applicationKeys](_schemas.md#applicationkeys) | Collection of applicationKeys |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Post

Create a new applicationKey for an application

```ruby
client.application_keys.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| applicationKey | [applicationKeyPost](_schemas.md#applicationkeypost) | Y | ApplicationKey information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [applicationKey](_schemas.md#applicationkey) | Successfully created applicationKey |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
