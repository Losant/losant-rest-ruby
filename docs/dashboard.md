# Dashboard Actions

Details on the various actions that can be performed on the
Dashboard resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

<br/>

## Get

Retrieves information on an dashboard

```ruby
client.dashboard.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| dashboardId | string | Y | ID of the associated dashboard |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [dashboard](_schemas.md#dashboard) | Dashboard information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |

<br/>

## Patch

Updates information about a dashboard

```ruby
client.dashboard.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| dashboardId | string | Y | ID of the associated dashboard |  |
| dashboard | [dashboardPatch](_schemas.md#dashboardpatch) | Y | Object containing new dashboard properties |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [dashboard](_schemas.md#dashboard) | Update dashboard information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |

<br/>

## Delete

Deletes an dashboard

```ruby
client.dashboard.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| dashboardId | string | Y | ID of the associated dashboard |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If dashboard was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if dashboard was not found |
