# Events Actions

Details on the various actions that can be performed on the
Events resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)
*   [Patch](#patch)
*   [Most Recent by Severity](#most-recent-by-severity)

<br/>

## Get

Returns the events for an application

```ruby
client.events.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |
| state | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [events](_schemas.md#events) | Collection of events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new event for an application

```ruby
client.events.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| event | [eventPost](_schemas.md#eventpost) | Y | New event information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [event](_schemas.md#event) | Successfully created event |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
| 429 | [error](_schemas.md#error) | Error if event creation rate limit exceeded |

<br/>

## Patch

Updates information for matching events by subject and/or current state

```ruby
client.events.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| filterField | string | N |  |
| filter | string | N |  |
| state | string | N |  |
| updates | [eventPatch](_schemas.md#eventpatch) | Y | Object containing updated information for the events |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If updates were successfully applied |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application is not found |

<br/>

## Most Recent by Severity

Returns the first new event ordered by severity and then creation

```ruby
client.events.most_recent_by_severity(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| filter | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The event, plus count of currently new events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
