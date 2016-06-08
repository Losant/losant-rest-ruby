# Application

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Debug](#debug)

### Get

Retrieves information on an application

```ruby
  client.application.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [application](_schemas.md#application) | Application information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Patch

Updates information about an application

```ruby
  client.application.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |
| application | [applicationPatch](_schemas.md#applicationpatch) | Y | Object containing new application properties |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [application](_schemas.md#application) | Updated application information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Delete

Deletes an application

```ruby
  client.application.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If application was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Debug

Streams real time application debug events using SSE

```ruby
  client.application.debug(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID of the associated application |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | Stream of application debug events |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
