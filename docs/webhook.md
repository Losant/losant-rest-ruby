# Webhook Actions

Details on the various actions that can be performed on the
Webhook resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Patch](#patch)

<br/>

## Delete

Deletes a webhook

```ruby
result = client.webhook.delete(
  applicationId: my_application_id,
  webhookId: my_webhook_id)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| webhookId | string | Y | ID associated with the webhook |  | 575ed78e7ae143cd83dc4aab |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If webhook was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if webhook was not found |

<br/>

## Get

Retrieves information on a webhook

```ruby
result = client.webhook.get(
  applicationId: my_application_id,
  webhookId: my_webhook_id)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| webhookId | string | Y | ID associated with the webhook |  | 575ed78e7ae143cd83dc4aab |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Webhook](_schemas.md#webhook) | Webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if webhook was not found |

<br/>

## Patch

Updates information about a webhook

```ruby
result = client.webhook.patch(
  applicationId: my_application_id,
  webhookId: my_webhook_id,
  webhook: my_webhook)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| webhookId | string | Y | ID associated with the webhook |  | 575ed78e7ae143cd83dc4aab |
| webhook | [Webhook Patch](_schemas.md#webhook-patch) | Y | Object containing new properties of the webhook |  | [Webhook Patch Example](_schemas.md#webhook-patch-example) |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Webhook](_schemas.md#webhook) | Updated webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if webhook was not found |
