# Flow Actions

Details on the various actions that can be performed on the
Flow resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Get Log Entries](#get-log-entries)
*   [Get Storage Entries](#get-storage-entries)
*   [Patch](#patch)
*   [Press Virtual Button](#press-virtual-button)
*   [Set Storage Entry](#set-storage-entry)

<br/>

## Delete

Deletes a flow

```ruby
client.flow.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If flow was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |

<br/>

## Get

Retrieves information on an flow

```ruby
client.flow.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](_schemas.md#workflow) | Flow information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |

<br/>

## Get Log Entries

Retrieve the recent log entries about the flows

```ruby
client.flow.get_log_entries(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |
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

## Get Storage Entries

Gets the current values in persistent storage

```ruby
client.flow.get_storage_entries(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The stored values |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |

<br/>

## Patch

Updates information about a flow

```ruby
client.flow.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |
| flow | [Workflow Patch](_schemas.md#workflow-patch) | Y | Object containing new properties of the flow |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](_schemas.md#workflow) | Updated flow information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if flow is not found |

<br/>

## Press Virtual Button

Presses the specified virtual button on the flow

```ruby
client.flow.press_virtual_button(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |
| button | [Virtual Button Press](_schemas.md#virtual-button-press) | Y | Object containing button key and payload |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | Virtual button was pressed |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |

<br/>

## Set Storage Entry

Sets a storage value

```ruby
client.flow.set_storage_entry(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| flowId | string | Y | ID associated with the flow |  |
| entry | [Workflow Storage Entry](_schemas.md#workflow-storage-entry) | Y | Object containing storage entry |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | Value was successfully stored |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |
