# Webhooks Actions

Details on the various actions that can be performed on the
Webhooks resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the webhooks for an application

```ruby
client.webhooks.get(params)
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

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhooks](_schemas.md#webhooks) | Collection of webhooks |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new webhook for an application

```ruby
client.webhooks.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| webhook | [webhookPost](_schemas.md#webhookpost) | Y | New webhook information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [webhook](_schemas.md#webhook) | Successfully created webhook |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
