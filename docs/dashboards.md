# Dashboards

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the dashboards owned by the current user

```ruby
  client.dashboards.get(params)
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
| orgId | string | N | undefined |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [dashboards](_schemas.md#dashboards) | Collection of dashboards |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Post

Create a new dasboard owned by the current user

```ruby
  client.dashboards.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| dashboard | [dashboardPost](_schemas.md#dashboardpost) | Y | New dashboard information |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [dashboard](_schemas.md#dashboard) | Successfully created dashboard |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
