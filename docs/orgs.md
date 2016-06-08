# Orgs Actions

Details on the various actions that can be performed on the
Orgs resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the organizations associated with the current user

```ruby
client.orgs.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [orgs](_schemas.md#orgs) | Collection of organizations |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new organization

```ruby
client.orgs.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| organization | [orgPost](_schemas.md#orgpost) | Y | New organization information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [org](_schemas.md#org) | Successfully created organization |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
