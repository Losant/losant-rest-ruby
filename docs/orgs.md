# Orgs

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the organizations associated with the current user

```ruby
  client.orgs.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| sortField | string | N | undefined |
| sortDirection | string | N | undefined |
| page | string | N | undefined |
| perPage | string | N | undefined |
| filterField | string | N | undefined |
| filter | string | N | undefined |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgs](_schemas.md#orgs) | Collection of organizations |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Post

Create a new organization

```ruby
  client.orgs.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| organization | [orgPost](_schemas.md#orgpost) | Y | New organization information |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [org](_schemas.md#org) | Successfully created organization |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
