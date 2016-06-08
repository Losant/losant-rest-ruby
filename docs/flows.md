# Flows

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the flows for an application

```ruby
client.flows.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N | undefined |
| sortDirection | string | N | undefined |
| page | string | N | undefined |
| perPage | string | N | undefined |
| filterField | string | N | undefined |
| filter | string | N | undefined |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [flows](_schemas.md#flows) | Collection of flows |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Post

Create a new flow for an application

```ruby
client.flows.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flow | [flowPost](_schemas.md#flowpost) | Y | New flow information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [flow](_schemas.md#flow) | Successfully created flow |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
