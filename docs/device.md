# Device

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Get State](#get-state)
*   [Send State](#send-state)
*   [Get Command](#get-command)
*   [Send Command](#send-command)
*   [Get Log Entries](#get-log-entries)

### Get

Retrieves information on an device

```ruby
  client.device.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [device](_schemas.md#device) | Device information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Patch

Updates information about a device

```ruby
  client.device.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| device | [devicePatch](_schemas.md#devicepatch) | Y | Object containing new properties of the device |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [device](_schemas.md#device) | Updated device information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Delete

Deletes a device

```ruby
  client.device.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If device was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Get State

Retrieve the last known state(s) of the device

```ruby
  client.device.get_state(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| limit | string | N | undefined |
| since | string | N | undefined |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceStates](_schemas.md#devicestates) | Recent device states |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Send State

Send the current state of the device

```ruby
  client.device.send_state(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| deviceState | [deviceState](_schemas.md#devicestate) | Y | Object containing the current state of the device |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If state was successfully received |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Get Command

Retrieve the last known commands(s) sent to the device

```ruby
  client.device.get_command(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| limit | string | N | undefined |
| since | string | N | undefined |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceCommands](_schemas.md#devicecommands) | Recent device commands |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Send Command

Send a command to a device

```ruby
  client.device.send_command(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| deviceCommand | [deviceCommand](_schemas.md#devicecommand) | Y | Command to send to the device |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If command was successfully sent |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Get Log Entries

Retrieve the recent log entries about the device

```ruby
  client.device.get_log_entries(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceId | string | Y | ID associated with the device |
| limit | string | N | undefined |
| since | string | N | undefined |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Recent log entries |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |
