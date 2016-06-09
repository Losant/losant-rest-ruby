# Event Actions

Details on the various actions that can be performed on the
Event resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Patch](#patch)

<br/>

## Delete

Deletes an event

```ruby
client.event.delete(
  applicationId: my_application_id,
  eventId: my_event_id
)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| eventId | string | Y | ID associated with the event |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If event was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if event was not found |

<br/>

## Get

Retrieves information on an event

```ruby
client.event.get(
  applicationId: my_application_id,
  eventId: my_event_id
)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| eventId | string | Y | ID associated with the event |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Event](_schemas.md#event) | Event information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if event was not found |

<br/>

## Patch

Updates information about an event

```ruby
client.event.patch(
  applicationId: my_application_id,
  eventId: my_event_id,
  event: my_event
)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| eventId | string | Y | ID associated with the event |  |
| event | [Event Patch](_schemas.md#event-patch) | Y | Object containing new properties of the event |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Event](_schemas.md#event) | Updated event information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if event is not found |
