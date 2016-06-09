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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| sortField | One of: subject, id, creationDate | N | Field to sort the results by | creationDate |
| sortDirection | One of: asc, desc | N | Direction to sort the results by | desc |
| page | string | N | Which page of results to return | 0 |
| perPage | string | N | How many items to return per page | 1000 |
| filterField | One of: subject | N | Field to filter the results by. Blank or not provided means no filtering. |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |
| state | One of: new, acknowledged, resolved | N | If provided, return events only in the given state. |  |

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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| event | [eventPost](_schemas.md#eventpost) | Y | New event information |  |

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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| filterField | One of: subject | N | Field to filter the events to act on by. Blank or not provided means no filtering. |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |
| state | One of: new, acknowledged, resolved | N | If provided, act on events only in the given state. |  |
| updates | [eventPatch](_schemas.md#eventpatch) | Y | Object containing updated information for the events |  |

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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| filter | string | N | Filter to apply against event subjects. Supports globbing. Blank or not provided means no filtering. |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The event, plus count of currently new events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
