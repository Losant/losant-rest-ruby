# Webhook

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

### Get

Retrieves information on an webhook

```ruby
  client.webhook.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| webhookId | string | Y | ID associated with the webhook |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhook](_schemas.md#webhook) | Webhook information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |

### Patch

Updates information about a webhook

```ruby
  client.webhook.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| webhookId | string | Y | ID associated with the webhook |
| webhook | [webhookPatch](_schemas.md#webhookpatch) | Y | Object containing new properties of the webhook |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhook](_schemas.md#webhook) | Updated webhook information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |

### Delete

Deletes a webhook

```ruby
  client.webhook.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| webhookId | string | Y | ID associated with the webhook |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If webhook was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |
