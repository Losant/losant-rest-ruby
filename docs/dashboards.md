# Dashboards Actions

Details on the various actions that can be performed on the
Dashboards resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the dashboards the current user has permission to see

```ruby
client.dashboards.get(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| sortField | One of: name, id, creationDate, ownerId | N | Field to sort the results by | name |
| sortDirection | One of: asc, desc | N | Direction to sort the results by | asc |
| page | string | N | Which page of results to return | 0 |
| perPage | string | N | How many items to return per page | 1000 |
| filterField | One of: name | N | Field to filter the results by. Blank or not provided means no filtering. |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |
| orgId | string | N | If not provided, return all dashboards. If provided but blank, only return dashboards belonging to the current user.  If provided and an id, only return dashboards belonging to the given organization id. |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboards](_schemas.md#dashboards) | Collection of dashboards |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Post

Create a new dasboard

```ruby
client.dashboards.post(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| dashboard | [Dashboard Post](_schemas.md#dashboard-post) | Y | New dashboard information |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Dashboard](_schemas.md#dashboard) | Successfully created dashboard |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
