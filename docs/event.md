# Event

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

### Get

Retrieves information on an event

```ruby
client.event.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| eventId | string | Y | ID associated with the event |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [event](_schemas.md#event) | Event information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if event was not found |

### Patch

Updates information about an event

```ruby
client.event.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| eventId | string | Y | ID associated with the event |
| event | [eventPatch](_schemas.md#eventpatch) | Y | Object containing new properties of the event |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [event](_schemas.md#event) | Updated event information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if event is not found |

### Delete

Deletes an event

```ruby
client.event.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| eventId | string | Y | ID associated with the event |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If event was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if event was not found |
