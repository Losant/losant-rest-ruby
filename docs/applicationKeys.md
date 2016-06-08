# Application Keys Actions

Details on the various actions that can be performed on the
Application Keys resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the applicationKeys for an application

```ruby
client.application_keys.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applicationKeys](_schemas.md#applicationkeys) | Collection of applicationKeys |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new applicationKey for an application

```ruby
client.application_keys.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| applicationKey | [applicationKeyPost](_schemas.md#applicationkeypost) | Y | ApplicationKey information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [applicationKey](_schemas.md#applicationkey) | Successfully created applicationKey |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
