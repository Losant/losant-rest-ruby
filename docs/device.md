# Device Actions

Details on the various actions that can be performed on the
Device resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Get Command](#get-command)
*   [Get Log Entries](#get-log-entries)
*   [Get State](#get-state)
*   [Patch](#patch)
*   [Send Command](#send-command)
*   [Send State](#send-state)

<br/>

## Delete

Deletes a device

```ruby
result = client.device.delete(
  applicationId: my_application_id,
  deviceId: my_device_id)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If device was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Get

Retrieves information on a device

```ruby
result = client.device.get(
  applicationId: my_application_id,
  deviceId: my_device_id)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](_schemas.md#device) | Device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Get Command

Retrieve the last known commands(s) sent to the device

```ruby
result = client.device.get_command(
  applicationId: my_application_id,
  deviceId: my_device_id)

puts result
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
| 200 | [Device Commands](_schemas.md#device-commands) | Recent device commands |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Get Log Entries

Retrieve the recent log entries about the device

```ruby
result = client.device.get_log_entries(
  applicationId: my_application_id,
  deviceId: my_device_id)

puts result
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
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Get State

Retrieve the last known state(s) of the device

```ruby
result = client.device.get_state(
  applicationId: my_application_id,
  deviceId: my_device_id)

puts result
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
| 200 | [Device States](_schemas.md#device-states) | Recent device states |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Patch

Updates information about a device

```ruby
result = client.device.patch(
  applicationId: my_application_id,
  deviceId: my_device_id,
  device: my_device)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| device | [Device Patch](_schemas.md#device-patch) | Y | Object containing new properties of the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](_schemas.md#device) | Updated device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Send Command

Send a command to a device

```ruby
result = client.device.send_command(
  applicationId: my_application_id,
  deviceId: my_device_id,
  deviceCommand: my_device_command)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| deviceCommand | [Device Command](_schemas.md#device-command) | Y | Command to send to the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If command was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if device was not found |

<br/>

## Send State

Send the current state of the device

```ruby
result = client.device.send_state(
  applicationId: my_application_id,
  deviceId: my_device_id,
  deviceState: my_device_state)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| deviceId | string | Y | ID associated with the device |  |
| deviceState | [Device State](_schemas.md#device-state) | Y | Object containing the current state of the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If state was successfully received |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if device was not found |
