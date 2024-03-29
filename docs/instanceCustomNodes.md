# Instance Custom Nodes Actions

Details on the various actions that can be performed on the
Instance Custom Nodes resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the Custom Nodes for an instance

```ruby
result = client.instance_custom_nodes.get(instanceId: my_instance_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceCustomNodes.*, or instanceCustomNodes.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| sortField | string | N | Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated | name | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | key |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*node |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Instance Custom Nodes](_schemas.md#instance-custom-nodes) | Collection of Custom Nodes |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Post

Create a new Custom Node for an instance

```ruby
result = client.instance_custom_nodes.post(
  instanceId: my_instance_id,
  instanceCustomNode: my_instance_custom_node)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.User, instanceCustomNodes.*, or instanceCustomNodes.post.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| instanceCustomNode | [Instance Custom Node Post](_schemas.md#instance-custom-node-post) | Y | Custom Node information |  | [Instance Custom Node Post Example](_schemas.md#instance-custom-node-post-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Instance Custom Node](_schemas.md#instance-custom-node) | The successfully created Custom Node |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
