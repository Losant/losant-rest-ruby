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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| sortField | One of: name, id, creationDate | N | Field to sort the results by | name |
| sortDirection | One of: asc, desc | N | Direction to sort the results by | asc |
| page | string | N | Which page of results to return | 0 |
| perPage | string | N | How many items to return per page | 1000 |
| filterField | One of: name | N | Field to filter the results by. Blank or not provided means no filtering. |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organizations](_schemas.md#organizations) | Collection of organizations |

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

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| organization | [Organization Post](_schemas.md#organization-post) | Y | New organization information |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Organization](_schemas.md#organization) | Successfully created organization |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
