# Devices Actions

Details on the various actions that can be performed on the
Devices resource, including the expected
parameters and the potential responses.

##### Contents

*   [Attribute Names](#attribute-names)
*   [Delete](#delete)
*   [Device Names](#device-names)
*   [Export](#export)
*   [Get](#get)
*   [Get Composite State](#get-composite-state)
*   [Patch](#patch)
*   [Payload Counts](#payload-counts)
*   [Post](#post)
*   [Remove Data](#remove-data)
*   [Restore](#restore)
*   [Send Command](#send-command)
*   [Tag Keys](#tag-keys)
*   [Tag Values](#tag-values)

<br/>

## Attribute Names

Gets the attribute names that match the given query. Maximum 1K returned.

```ruby
result = client.devices.attribute_names(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.attributeNames.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device filter JSON object |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| dataType | [Device Attribute Data Type Filter](_schemas.md#device-attribute-data-type-filter) | N | Filter the devices by the given attribute data type or types |  | [Device Attribute Data Type Filter Example](_schemas.md#device-attribute-data-type-filter-example) |
| startsWith | string | N | Filter attributes down to those that have names starting with the given string. Case insensitive. |  | temper |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Attribute Names Response](_schemas.md#attribute-names-response) | The matching attribute names |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Delete

Delete devices

```ruby
result = client.devices.delete(
  applicationId: my_application_id,
  options: my_options)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.delete.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| options | [Devices Delete Or Restore Post](_schemas.md#devices-delete-or-restore-post) | Y | Object containing device deletion options |  | [Devices Delete Or Restore Post Example](_schemas.md#devices-delete-or-restore-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Bulk Deletion Response](_schemas.md#bulk-deletion-response) | Object indicating number of devices deleted or failed |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If a job was enqueued for the devices to be deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Device Names

Gets the device names that match the given query. Maximum 1K returned.

```ruby
result = client.devices.device_names(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.deviceNames.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device filter JSON object |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| startsWith | string | N | Filter devices down to those that have names starting with the given string. Case insensitive. |  | temper |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Names Response](_schemas.md#device-names-response) | The matching device names |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Export

Creates an export of all device metadata

```ruby
result = client.devices.export(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.export.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| email | string | N | Email address to send export to. Defaults to current user&#x27;s email. |  | email@example.com |
| callbackUrl | string | N | Callback URL to call with export result |  | https://example.com/cburl |
| options | [Devices Metadata Export Post](_schemas.md#devices-metadata-export-post) | N | Object containing device query and optionally email or callback |  | [Devices Metadata Export Post Example](_schemas.md#devices-metadata-export-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If generation of export was successfully started |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Get

Returns the devices for an application

```ruby
result = client.devices.get(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| sortField | string | N | Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated, connectionStatus, deletedAt | name | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * device |
| deviceClass | [Device Class Filter](_schemas.md#device-class-filter) | N | Filter the devices by the given device class or classes |  | [Device Class Filter Example](_schemas.md#device-class-filter-example) |
| tagFilter | [Device Tag Filter](_schemas.md#device-tag-filter) | N | Array of tag pairs to filter by |  | [Device Tag Filter Example](_schemas.md#device-tag-filter-example) |
| excludeConnectionInfo | string | N | If set, do not return connection info |  | true |
| parentId | string | N | Filter devices as children of a given system id |  | 575ecf887ae143cd83dc4aa2 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device filter JSON object which overrides the filterField, filter, deviceClass, tagFilter, and parentId parameters. |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| tagsAsObject | string | N | Return tags as an object map instead of an array |  | true |
| attributesAsObject | string | N | Return attributes as an object map instead of an array |  | false |
| queryDeleted | string | N | If true, endpoint will return recently deleted devices instead |  | false |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Devices](_schemas.md#devices) | Collection of devices |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Get Composite State

Retrieve the composite last complete state of the matching devices

```ruby
result = client.devices.get_composite_state(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.getCompositeState.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| start | string | N | Start of time range to look at to build composite state | 1 | 1465790400000 |
| end | string | N | End of time range to look at to build composite state | 0 | 1465790400000 |
| attributes | string | N | Comma-separated list of attributes to include. When not provided, returns all attributes. |  | myAttr1,myAttr2 |
| sortField | string | N | Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated, connectionStatus | name | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device advanced query JSON object |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Devices Composite State](_schemas.md#devices-composite-state) | Collection of composite last state of the devices |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Patch

Update the fields of one or more devices

```ruby
result = client.devices.patch(
  applicationId: my_application_id,
  patchInfo: my_patch_info)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.patch.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| patchInfo | [Devices Patch](_schemas.md#devices-patch) | Y | Object containing device query or IDs and update operations |  | [Devices Patch Example](_schemas.md#devices-patch-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Devices Updated](_schemas.md#devices-updated) | Object including an update log link and the number of devices updated, failed, and skipped |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | Successfully queued bulk update job |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Payload Counts

Creates an export of payload count information for the matching devices

```ruby
result = client.devices.payload_counts(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.payloadCounts.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| options | [Devices Payload Count Export Post](_schemas.md#devices-payload-count-export-post) | N | Object containing export configuration |  | [Devices Payload Count Export Post Example](_schemas.md#devices-payload-count-export-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If generation of export was successfully started |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new device for an application

```ruby
result = client.devices.post(
  applicationId: my_application_id,
  device: my_device)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.post.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| device | [Device Post](_schemas.md#device-post) | Y | New device information |  | [Device Post Example](_schemas.md#device-post-example) |
| tagsAsObject | string | N | Return tags as an object map instead of an array |  | true |
| attributesAsObject | string | N | Return attributes as an object map instead of an array |  | false |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Device](_schemas.md#device) | Successfully created device |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Remove Data

Removes all device data for the specified time range. Defaults to all data.

```ruby
result = client.devices.remove_data(
  applicationId: my_application_id,
  options: my_options)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.removeData.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| options | [Devices Remove Data Post](_schemas.md#devices-remove-data-post) | Y | Object defining the device data to delete and devices to delete from |  | [Devices Remove Data Post Example](_schemas.md#devices-remove-data-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If a job was enqueued for device data to be removed |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Restore

Restore deleted devices

```ruby
result = client.devices.restore(
  applicationId: my_application_id,
  options: my_options)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.restore.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| options | [Devices Delete Or Restore Post](_schemas.md#devices-delete-or-restore-post) | Y | Object containing device restoration options |  | [Devices Delete Or Restore Post Example](_schemas.md#devices-delete-or-restore-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Bulk Restoration Response](_schemas.md#bulk-restoration-response) | Object indicating number of devices restored or failed |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If a job was enqueued for the devices to be restored |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Send Command

Send a command to multiple devices

```ruby
result = client.devices.send_command(
  applicationId: my_application_id,
  multiDeviceCommand: my_multi_device_command)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Device, all.Organization, all.User, devices.*, or devices.sendCommand.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| multiDeviceCommand | [Multi Device Command](_schemas.md#multi-device-command) | Y | Command to send to the device |  | [Multi Device Command Example](_schemas.md#multi-device-command-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If command was successfully sent |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If command was queued to be sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Tag Keys

Gets the unique tag keys for devices that match the given query. Maximum 1K returned.

```ruby
result = client.devices.tag_keys(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.tagKeys.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device filter JSON object |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| startsWith | string | N | Filter keys down to those that start with the given string. Case insensitive. |  | temper |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Tag Keys Response](_schemas.md#tag-keys-response) | The matching tag keys |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Tag Values

Gets the unique tag values for the given key for devices that match the given query. Maximum 1K returned.

```ruby
result = client.devices.tag_values(
  applicationId: my_application_id,
  key: my_key)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.tagValues.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| query | [Advanced Device Query](_schemas.md#advanced-device-query) | N | Device filter JSON object |  | [Advanced Device Query Example](_schemas.md#advanced-device-query-example) |
| key | string | Y | The tag key to get the values for |  | myKey |
| startsWith | string | N | Filter values down to those that start with the given string. Case insensitive. |  | temper |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Tag Values Response](_schemas.md#tag-values-response) | The matching tag values |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |
