# Org

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Pending Invites](#pending-invites)
*   [Invite Member](#invite-member)
*   [Revoke Invite](#revoke-invite)
*   [Modify Member](#modify-member)
*   [Remove Member](#remove-member)

### Get

Retrieves information on an organization

```ruby
client.org.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Organization information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization not found |

### Patch

Updates information about an organization

```ruby
client.org.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| organization | [orgPatch](_schemas.md#orgpatch) | Y | Object containing new organization properties |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization was not found |

### Delete

Deletes an organization

```ruby
client.org.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If organization was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization was not found |

### Pending Invites

Gets the current pending invites

```ruby
client.org.pending_invites(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if organization not found |

### Invite Member

Invites a person to an organization

```ruby
client.org.invite_member(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| invite | [orgInvitePost](_schemas.md#orginvitepost) | Y | Object containing new invite info |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

### Revoke Invite

Revokes an existing invite

```ruby
client.org.revoke_invite(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| inviteId | string | Y | Id of invite to revoke |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgInvites](_schemas.md#orginvites) | Invitation information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

### Modify Member

Modifies a current org member&#x27;s role

```ruby
client.org.modify_member(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| member | [orgMemberPatch](_schemas.md#orgmemberpatch) | Y | Object containing new member pair |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |

### Remove Member

Modifies a current org member&#x27;s role

```ruby
client.org.remove_member(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| orgId | string | Y | ID associated with the organization |
| userId | string | Y | Id of user to remove |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [org](_schemas.md#org) | Updated organization information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if organization not found |
