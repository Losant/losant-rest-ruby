# Device Actions

Details on the various actions that can be performed on the
Device resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Get State](#get-state)
*   [Send State](#send-state)
*   [Get Command](#get-command)
*   [Send Command](#send-command)
*   [Get Log Entries](#get-log-entries)

<br/>

## Get

Retrieves information on an device

```ruby
client.device.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [device](_schemas.md#device) | Device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Patch

Updates information about a device

```ruby
client.device.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| device | [devicePatch](_schemas.md#devicepatch) | Y | Object containing new properties of the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [device](_schemas.md#device) | Updated device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Delete

Deletes a device

```ruby
client.device.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If device was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Get State

Retrieve the last known state(s) of the device

```ruby
client.device.get_state(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| limit | string | N | Max state entries to return (ordered by time descending) | 1 |
| since | string | N | Look for state entries since this time (ms since epoch) |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceStates](_schemas.md#devicestates) | Recent device states |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Send State

Send the current state of the device

```ruby
client.device.send_state(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| deviceState | [deviceState](_schemas.md#devicestate) | Y | Object containing the current state of the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If state was successfully received |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Get Command

Retrieve the last known commands(s) sent to the device

```ruby
client.device.get_command(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| limit | string | N | Max command entries to return (ordered by time descending) | 1 |
| since | string | N | Look for command entries since this time (ms since epoch) |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceCommands](_schemas.md#devicecommands) | Recent device commands |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Send Command

Send a command to a device

```ruby
client.device.send_command(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| deviceCommand | [deviceCommand](_schemas.md#devicecommand) | Y | Command to send to the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If command was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

<br/>

## Get Log Entries

Retrieve the recent log entries about the device

```ruby
client.device.get_log_entries(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| limit | string | N | Max log entries to return (ordered by time descending) | 1 |
| since | string | N | Look for log entries since this time (ms since epoch) |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Recent log entries |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |
