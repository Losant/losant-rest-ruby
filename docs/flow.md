# Flow

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Debug](#debug)
*   [Get Log Entries](#get-log-entries)
*   [Press Virtual Button](#press-virtual-button)
*   [Get Storage Entries](#get-storage-entries)
*   [Set Storage Entry](#set-storage-entry)

### Get

Retrieves information on an flow

```ruby
client.flow.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [flow](_schemas.md#flow) | Flow information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |

### Patch

Updates information about a flow

```ruby
client.flow.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |
| flow | [flowPatch](_schemas.md#flowpatch) | Y | Object containing new properties of the flow |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [flow](_schemas.md#flow) | Updated flow information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if flow is not found |

### Delete

Deletes a flow

```ruby
client.flow.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If flow was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |

### Debug

Streams real time flow debug events using SSE

```ruby
client.flow.debug(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Stream of flow debug events |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |

### Get Log Entries

Retrieve the recent log entries about the flows

```ruby
client.flow.get_log_entries(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |
| limit | string | N | undefined |
| since | string | N | undefined |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Recent log entries |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device was not found |

### Press Virtual Button

Presses the specified virtual button on the flow

```ruby
client.flow.press_virtual_button(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |
| button | [virtualButtonPress](_schemas.md#virtualbuttonpress) | Y | Object containing button key and payload |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | Virtual button was pressed |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |

### Get Storage Entries

Gets the current values in persistent storage

```ruby
client.flow.get_storage_entries(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The stored values |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |

### Set Storage Entry

Sets a storage value

```ruby
client.flow.set_storage_entry(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| flowId | string | Y | ID associated with the flow |
| entry | [flowStorageEntry](_schemas.md#flowstorageentry) | Y | Object containing storage entry |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | Value was successfully stored |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if flow was not found |
