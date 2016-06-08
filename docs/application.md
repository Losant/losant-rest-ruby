# Application Actions

Details on the various actions that can be performed on the
Application resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Debug](#debug)

<br/>

## Get

Retrieves information on an application

```ruby
client.application.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [application](_schemas.md#application) | Application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Patch

Updates information about an application

```ruby
client.application.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |
| application | [applicationPatch](_schemas.md#applicationpatch) | Y | Object containing new application properties |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [application](_schemas.md#application) | Updated application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Delete

Deletes an application

```ruby
client.application.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If application was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Debug

Streams real time application debug events using SSE

```ruby
client.application.debug(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Stream of application debug events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
