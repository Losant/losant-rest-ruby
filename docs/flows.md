# Flows Actions

Details on the various actions that can be performed on the
Flows resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the flows for an application

```ruby
client.flows.get(params)
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
| 200 | [flows](_schemas.md#flows) | Collection of flows |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new flow for an application

```ruby
client.flows.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flow | [flowPost](_schemas.md#flowpost) | Y | New flow information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [flow](_schemas.md#flow) | Successfully created flow |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
