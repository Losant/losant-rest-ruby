# Dashboards Actions

Details on the various actions that can be performed on the
Dashboards resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the dashboards owned by the current user

```ruby
client.dashboards.get(params)
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
| 200 | [dashboards](_schemas.md#dashboards) | Collection of dashboards |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new dasboard owned by the current user

```ruby
client.dashboards.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| dashboard | [dashboardPost](_schemas.md#dashboardpost) | Y | New dashboard information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [dashboard](_schemas.md#dashboard) | Successfully created dashboard |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
