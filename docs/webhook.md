# Webhook Actions

Details on the various actions that can be performed on the
Webhook resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)

<br/>

## Get

Retrieves information on an webhook

```ruby
client.webhook.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| webhookId | string | Y | ID associated with the webhook |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhook](_schemas.md#webhook) | Webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |

<br/>

## Patch

Updates information about a webhook

```ruby
client.webhook.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| webhookId | string | Y | ID associated with the webhook |  |
| webhook | [webhookPatch](_schemas.md#webhookpatch) | Y | Object containing new properties of the webhook |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [webhook](_schemas.md#webhook) | Updated webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |

<br/>

## Delete

Deletes a webhook

```ruby
client.webhook.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| webhookId | string | Y | ID associated with the webhook |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If webhook was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if webhook was not found |
