# Devices Actions

Details on the various actions that can be performed on the
Devices resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)
*   [Send Command](#send-command)

<br/>

## Get

Returns the devices for an application

```ruby
client.devices.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| sortField | One of: name, id, creationDate | N | Field to sort the results by | name |
| sortDirection | One of: asc, desc | N | Direction to sort the results by | asc |
| page | string | N | Which page of results to return | 0 |
| perPage | string | N | How many items to return per page | 1000 |
| filterField | One of: name | N | Field to filter the results by. Blank or not provided means no filtering. |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |
| tagFilter | [deviceTagFilter](_schemas.md#devicetagfilter) | N | Array of tag pairs to filter by. |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [devices](_schemas.md#devices) | Collection of devices |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new device for an application

```ruby
client.devices.post(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| device | [devicePost](_schemas.md#devicepost) | Y | New device information |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [device](_schemas.md#device) | Successfully created device |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Send Command

Send a command to multiple devices

```ruby
client.devices.send_command(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| multiDeviceCommand | [multiDeviceCommand](_schemas.md#multidevicecommand) | Y | Command to send to the device |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If command was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
