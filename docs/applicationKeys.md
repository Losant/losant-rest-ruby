# Application Keys Actions

Details on the various actions that can be performed on the
Application Keys resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the applicationKeys for an application

```ruby
result = client.application_keys.get(applicationId: my_application_id)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| sortField | string | N | Field to sort the results by. Accepted values are: key, status, id, creationDate | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc |
| page | string | N | Which page of results to return | 0 |
| perPage | string | N | How many items to return per page | 1000 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: key, status |  |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Keys](_schemas.md#application-keys) | Collection of applicationKeys |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new applicationKey for an application

```ruby
result = client.application_keys.post(
  applicationId: my_application_id,
  applicationKey: my_application_key)

puts result
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| applicationKey | [Application Key Post](_schemas.md#application-key-post) | Y | ApplicationKey information |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Application Key](_schemas.md#application-key) | Successfully created applicationKey |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |
