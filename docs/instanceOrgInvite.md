# Instance Org Invite Actions

Details on the various actions that can be performed on the
Instance Org Invite resource, including the expected
parameters and the potential responses.

##### Contents

*   [Delete](#delete)
*   [Get](#get)
*   [Resend Invite](#resend-invite)

<br/>

## Delete

Revokes an instance org invitation

```ruby
result = client.instance_org_invite.delete(
  instanceId: my_instance_id,
  orgId: my_org_id,
  inviteId: my_invite_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.User, instanceOrgInvite.*, or instanceOrgInvite.delete.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec8687ae143cd83dc4a95 |
| orgId | string | Y | ID associated with the organization |  | 575ec8687ae143cd83dc4a97 |
| inviteId | string | Y | ID associated with the organization invite |  | 575ec8687ae143cd83dc4a94 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If an invite was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if instance, organization or invite was not found |

<br/>

## Get

Returns an organization invite

```ruby
result = client.instance_org_invite.get(
  instanceId: my_instance_id,
  orgId: my_org_id,
  inviteId: my_invite_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceOrgInvite.*, or instanceOrgInvite.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec8687ae143cd83dc4a95 |
| orgId | string | Y | ID associated with the organization |  | 575ec8687ae143cd83dc4a97 |
| inviteId | string | Y | ID associated with the organization invite |  | 575ec8687ae143cd83dc4a94 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitation](_schemas.md#organization-invitation) | A single organization invite |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if instance, organization, or invite was not found |

<br/>

## Resend Invite

Resend an organization invite with modified role info

```ruby
result = client.instance_org_invite.resend_invite(
  instanceId: my_instance_id,
  orgId: my_org_id,
  inviteId: my_invite_id,
  roleInfo: my_role_info)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.User, instanceOrgInvite.*, or instanceOrgInvite.resendInvite.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec8687ae143cd83dc4a95 |
| orgId | string | Y | ID associated with the organization |  | 575ec8687ae143cd83dc4a97 |
| inviteId | string | Y | ID associated with the organization invite |  | 575ec8687ae143cd83dc4a94 |
| roleInfo | [Organization Role Info](_schemas.md#organization-role-info) | Y | Object containing updated role info |  | [Organization Role Info Example](_schemas.md#organization-role-info-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Organization Invitation](_schemas.md#organization-invitation) | The new org invite |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if instance, organization, or invite was not found |
