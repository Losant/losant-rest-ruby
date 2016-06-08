# Orgs

## Actions

*   [Get](#get)
*   [Post](#post)

### Get

Returns the organizations associated with the current user

```ruby
client.orgs.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgs](_schemas.md#orgs) | Collection of organizations |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |

### Post

Create a new organization

```ruby
client.orgs.post(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| organization | [orgPost](_schemas.md#orgpost) | Y | New organization information |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [org](_schemas.md#org) | Successfully created organization |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
