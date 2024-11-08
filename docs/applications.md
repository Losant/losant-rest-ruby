# Applications Actions

Details on the various actions that can be performed on the
Applications resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Import](#import)
*   [Period Summaries](#period-summaries)
*   [Post](#post)

<br/>

## Get

Returns the applications the current user has permission to see

```ruby
result = client.applications.get(optional_params)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.cli, all.User.read, applications.*, or applications.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| sortField | string | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId, lastUpdated | name | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * app |
| orgId | string | N | If not provided, return all applications. If provided but blank, only return applications belonging to the current user. If provided and an id, only return applications belonging to the given organization id. |  | 575ecdf07ae143cd83dc4a9a |
| summaryExclude | string | N | Comma-separated list of summary fields to exclude from application summary |  | payloadCount |
| summaryInclude | string | N | Comma-separated list of summary fields to include in application summary |  | payloadCount |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Applications](_schemas.md#applications) | Collection of applications |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Import

Create a new application from an import bundle

```ruby
result = client.applications.import(optional_params)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Organization, all.User, applications.*, or applications.import.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| importBundle | file | N | The zip file containing the application to import and all of its resources |  | undefined |
| ownerId | string | N | The owner id of the new application, defaults to the id of the user making the request |  | 575ed6e87ae143cd83dc4aa8 |
| ownerType | string | N | The type of the owner id. Accepted values are: user, organization | user | user |
| includeDevices | string | N | If set, import devices from the import bundle |  | true |
| includeDataTableRows | string | N | If set, import data table rows from import bundle |  | true |
| includeFiles | string | N | If set, import files from import bundle |  | true |
| email | string | N | Email address to notify the user when the job to import the application has completed or errored, defaults to the email address of the user making the request |  | email@example.com |
| options | [Applications Import Options](_schemas.md#applications-import-options) | N | Additional import options |  | [Applications Import Options Example](_schemas.md#applications-import-options-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Application Creation By Template Result](_schemas.md#application-creation-by-template-result) | Successfully created application |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If application was enqueued to be imported |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |
| 422 | [Validation Error](_schemas.md#validation-error) | Error if too many validation errors occurred on other resources |

<br/>

## Period Summaries

Returns application usage summaries over a selected date range

```ruby
result = client.applications.period_summaries(optional_params)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, applications.*, or applications.periodSummaries.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| start | string | N | Start of range for resource count queries (ms since epoch) |  | 0 |
| end | string | N | End of range for resource count queries (ms since epoch) |  | 1465790400000 |
| asBytes | string | N | If the resulting payload counts should be returned as bytes | false | true |
| includeNonBillable | string | N | If non-billable payloads should be included in the result | false | true |
| sortField | string | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId, lastUpdated | name | name |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * app |
| orgId | string | N | If not provided, return all applications. If provided but blank, only return applications belonging to the current user. If provided and an id, only return applications belonging to the given organization id. |  | 575ecdf07ae143cd83dc4a9a |
| exclude | string | N | Comma-separated list of resources to exclude from summary |  | payloadCounts, deviceCounts, notebookMinuteCounts |
| include | string | N | Comma-separated list of summary fields to include in application summary |  | deviceCounts |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Period Summaries](_schemas.md#application-period-summaries) | Collection of application period summaries |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |

<br/>

## Post

Create a new application

```ruby
result = client.applications.post(application: my_application)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Organization, all.User, applications.*, or applications.post.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| application | [Application Post](_schemas.md#application-post) | Y | New application information |  | [Application Post Example](_schemas.md#application-post-example) |
| summaryExclude | string | N | Comma-separated list of summary fields to exclude from application summary |  | payloadCount |
| summaryInclude | string | N | Comma-separated list of summary fields to include in application summary |  | payloadCount |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Application](_schemas.md#application) | Successfully created application |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
