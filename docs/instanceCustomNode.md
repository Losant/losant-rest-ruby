# Instance Custom Node Actions

Details on the various actions that can be performed on the
Instance Custom Node resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Errors](#errors)
*   [Get](#get)
*   [Patch](#patch)
*   [Stats](#stats)

<br/>

## Delete

Deletes a Custom Node

```ruby
result = client.instance_custom_node.delete(
  instanceId: my_instance_id,
  instanceCustomNodeId: my_instance_custom_node_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.User, instanceCustomNode.*, or instanceCustomNode.delete.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNodeId | string | Y | ID associated with the Custom Node |  | 575ec7417ae143cd83dc4a95 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If Custom Node was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if Custom Node was not found |

<br/>

## Errors

Get information about errors that occurred during runs of this Custom Node

```ruby
result = client.instance_custom_node.errors(
  instanceId: my_instance_id,
  instanceCustomNodeId: my_instance_custom_node_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceCustomNode.*, or instanceCustomNode.errors.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNodeId | string | Y | ID associated with the Custom Node |  | 575ec7417ae143cd83dc4a95 |
| duration | string | N | Duration of time range in milliseconds | 86400000 | 86400000 |
| end | string | N | End of time range in milliseconds since epoch | 0 | 0 |
| limit | string | N | Maximum number of errors to return | 25 | 25 |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | desc | desc |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Errors](_schemas.md#workflow-errors) | Custom Node error information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if Custom Node was not found |

<br/>

## Get

Retrieves information on a Custom Node

```ruby
result = client.instance_custom_node.get(
  instanceId: my_instance_id,
  instanceCustomNodeId: my_instance_custom_node_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceCustomNode.*, or instanceCustomNode.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNodeId | string | Y | ID associated with the Custom Node |  | 575ec7417ae143cd83dc4a95 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Instance Custom Node](_schemas.md#instance-custom-node) | Custom Node information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if Custom Node was not found |

<br/>

## Patch

Updates information about a Custom Node

```ruby
result = client.instance_custom_node.patch(
  instanceId: my_instance_id,
  instanceCustomNodeId: my_instance_custom_node_id,
  instanceCustomNode: my_instance_custom_node)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.User, instanceCustomNode.*, or instanceCustomNode.patch.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNodeId | string | Y | ID associated with the Custom Node |  | 575ec7417ae143cd83dc4a95 |
| instanceCustomNode | [Instance Custom Node Patch](_schemas.md#instance-custom-node-patch) | Y | Object containing new properties of the Custom Node |  | [Instance Custom Node Patch Example](_schemas.md#instance-custom-node-patch-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Instance Custom Node](_schemas.md#instance-custom-node) | Updated Custom Node information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if Custom Node was not found |

<br/>

## Stats

Get statistics about runs for this Custom Node

```ruby
result = client.instance_custom_node.stats(
  instanceId: my_instance_id,
  instanceCustomNodeId: my_instance_custom_node_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceCustomNode.*, or instanceCustomNode.stats.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNodeId | string | Y | ID associated with the Custom Node |  | 575ec7417ae143cd83dc4a95 |
| duration | string | N | Duration of time range in milliseconds | 86400000 | 86400000 |
| end | string | N | End of time range in milliseconds since epoch | 0 | 0 |
| resolution | string | N | Resolution in milliseconds | 3600000 | 3600000 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Statistics](_schemas.md#workflow-statistics) | Statistics for Custom Node runs |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if Custom Node was not found |
