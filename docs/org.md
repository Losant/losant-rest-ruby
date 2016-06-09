# Org Actions

Details on the various actions that can be performed on the
Org resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Pending Invites](#pending-invites)
*   [Invite Member](#invite-member)
*   [Revoke Invite](#revoke-invite)
*   [Modify Member](#modify-member)
*   [Remove Member](#remove-member)

<br/>

## Get

Retrieves information on an organization

```ruby
client.org.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization not found |

<br/>

## Patch

Updates information about an organization

```ruby
client.org.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |
| organization | [orgPatch](_schemas.md#orgpatch) | Y | Object containing new organization properties |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization was not found |

<br/>

## Delete

Deletes an organization

```ruby
client.org.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If organization was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization was not found |

<br/>

## Pending Invites

Gets the current pending invites

```ruby
client.org.pending_invites(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization not found |

<br/>

## Invite Member

Invites a person to an organization

```ruby
client.org.invite_member(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |
| invite | [orgInvitePost](_schemas.md#orginvitepost) | Y | Object containing new invite info |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

<br/>

## Revoke Invite

Revokes an existing invite

```ruby
client.org.revoke_invite(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |
| inviteId | string | Y | Id of invite to revoke |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

<br/>

## Modify Member

Modifies a current org member&#x27;s role

```ruby
client.org.modify_member(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |
| member | [orgMemberPatch](_schemas.md#orgmemberpatch) | Y | Object containing new member pair |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

<br/>

## Remove Member

Modifies a current org member&#x27;s role

```ruby
client.org.remove_member(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| orgId | string | Y | ID associated with the organization |  |
| userId | string | Y | Id of user to remove |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |
