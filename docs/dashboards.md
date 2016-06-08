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

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [dashboard](_schemas.md#dashboard) | Successfully created dashboard |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
