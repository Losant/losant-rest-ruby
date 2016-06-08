# Dashboard

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

### Get

Retrieves information on an dashboard

```ruby
  client.dashboard.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| dashboardId | string | Y | ID of the associated dashboard |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [dashboard](_schemas.md#dashboard) | Dashboard information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |

### Patch

Updates information about a dashboard

```ruby
  client.dashboard.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| dashboardId | string | Y | ID of the associated dashboard |
| dashboard | [dashboardPatch](_schemas.md#dashboardpatch) | Y | Object containing new dashboard properties |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [dashboard](_schemas.md#dashboard) | Update dashboard information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |

### Delete

Deletes an dashboard

```ruby
  client.dashboard.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| dashboardId | string | Y | ID of the associated dashboard |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If dashboard was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |
