# Application Key

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

### Get

Retrieves information on an applicationKey

```ruby
client.application_key.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| applicationKeyId | string | Y | ID associated with the applicationKey |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applicationKey](_schemas.md#applicationkey) | applicationKey information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if applicationKey was not found |

### Patch

Updates information about an applicationKey

```ruby
client.application_key.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| applicationKeyId | string | Y | ID associated with the applicationKey |
| applicationKey | [applicationKeyPatch](_schemas.md#applicationkeypatch) | Y | Object containing new properties of the applicationKey |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [applicationKey](_schemas.md#applicationkey) | Updated applicationKey information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if applicationKey was not found |

### Delete

Deletes an applicationKey

```ruby
client.application_key.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| applicationKeyId | string | Y | ID associated with the applicationKey |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If applicationKey was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if applicationKey was not found |
