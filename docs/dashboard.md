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

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If dashboard was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |
