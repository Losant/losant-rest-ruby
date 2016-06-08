# Webhooks

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the webhooks for an application

```ruby
client.webhooks.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhooks](_schemas.md#webhooks) | Collection of webhooks |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Post

Create a new webhook for an application

```ruby
client.webhooks.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| webhook | [webhookPost](_schemas.md#webhookpost) | Y | New webhook information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [webhook](_schemas.md#webhook) | Successfully created webhook |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
