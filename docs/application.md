# Application Actions

Details on the various actions that can be performed on the
Application resource, including the expected
parameters and the potential responses.

##### Contents

*   [Apply Template](#apply-template)
*   [Archive Data](#archive-data)
*   [Backfill Archive Data](#backfill-archive-data)
*   [Clone](#clone)
*   [Delete](#delete)
*   [Device Counts](#device-counts)
*   [Export](#export)
*   [Full Data Tables Archive](#full-data-tables-archive)
*   [Full Events Archive](#full-events-archive)
*   [Get](#get)
*   [Globals](#globals)
*   [Import](#import)
*   [Import Logs](#import-logs)
*   [Mqtt Publish Message](#mqtt-publish-message)
*   [Notebook Minute Counts](#notebook-minute-counts)
*   [Patch](#patch)
*   [Payload Counts](#payload-counts)
*   [Payload Counts Breakdown](#payload-counts-breakdown)
*   [Readme](#readme)
*   [Readme Patch](#readme-patch)
*   [Search](#search)

<br/>

## Apply Template

Add resources to an application via an application template

```ruby
result = client.application.apply_template(
  applicationId: my_application_id,
  options: my_options)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.applyTemplate.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| options | [Application Apply Template Patch Schema](_schemas.md#application-apply-template-patch-schema) | Y | Object containing template import options |  | [Application Apply Template Patch Schema Example](_schemas.md#application-apply-template-patch-schema-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](_schemas.md#application) | Updated application information |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If a job was enqueued for the resources to be imported into the application |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |

<br/>

## Archive Data

Returns success when a job has been enqueued to archive this application&#x27;s device data for a given day

```ruby
result = client.application.archive_data(
  applicationId: my_application_id,
  date: my_date)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.archiveData.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| date | string | Y | The date to archive data (ms since epoch), it must be within the archive time range older than 31 days and newer than the organizations dataTTL |  | 1518556791829 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | Enqueued a job to archive this applications device data |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Backfill Archive Data

Returns success when a job has been enqueued to backfill all current data to its archive

```ruby
result = client.application.backfill_archive_data(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.backfillArchiveData.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | Enqueued a job to backfill device data to this application archive location |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Clone

Copy an application into a new application

```ruby
result = client.application.clone(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.clone.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| options | [Application Clone Post Schema](_schemas.md#application-clone-post-schema) | N | Object containing optional clone fields |  | [Application Clone Post Schema Example](_schemas.md#application-clone-post-schema-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success Dry Run](_schemas.md#success-dry-run) | if dryRun is set and successful, then return success |
| 201 | [Application Creation By Template Result](_schemas.md#application-creation-by-template-result) | If application was successfully cloned |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If application was enqueued to be cloned |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |
| 422 | [Validation Error](_schemas.md#validation-error) | Error if too many validation errors occurred on other resources |

<br/>

## Delete

Deletes an application

```ruby
result = client.application.delete(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.delete.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | If application was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Device Counts

Returns device counts by day for the time range specified for this application

```ruby
result = client.application.device_counts(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.deviceCounts.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| start | string | N | Start of range for device count query (ms since epoch) |  | 0 |
| end | string | N | End of range for device count query (ms since epoch) |  | 1465790400000 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Counts](_schemas.md#device-counts) | Device counts by day |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Export

Export an application and all of its resources

```ruby
result = client.application.export(
  applicationId: my_application_id,
  options: my_options)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.export.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| options | [Application Export Post Schema](_schemas.md#application-export-post-schema) | Y | Object containing export application options |  | [Application Export Post Schema Example](_schemas.md#application-export-post-schema-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Export Result](_schemas.md#application-export-result) | a url to download the zip of exported resources |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If application was enqueued to be exported |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |

<br/>

## Full Data Tables Archive

Returns success when a job has been enqueued to archive all selected data tables

```ruby
result = client.application.full_data_tables_archive(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.fullDataTablesArchive.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | Enqueued a job to archive all selected data tables of this application archive location |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Full Events Archive

Returns success when a job has been enqueued to archive all current events

```ruby
result = client.application.full_events_archive(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.fullEventsArchive.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | Enqueued a job to archive all events to this application archive location |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Get

Retrieves information on an application

```ruby
result = client.application.get(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.cli, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.cli, all.User.read, application.*, or application.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| summaryExclude | string | N | Comma-separated list of summary fields to exclude from application summary |  | payloadCount |
| summaryInclude | string | N | Comma-separated list of summary fields to include in application summary |  | payloadCount |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](_schemas.md#application) | Application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Globals

Updates an application global at the given key

```ruby
result = client.application.globals(
  applicationId: my_application_id,
  globals: my_globals)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, application.*, or application.patch.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| globals | [Application Global Patch](_schemas.md#application-global-patch) | Y | Array of objects containing new application global information |  | [Application Global Patch Example](_schemas.md#application-global-patch-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](_schemas.md#application) | Updated application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Import

Add multiple resources to an application via a zip file

```ruby
result = client.application.import(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.import.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| importBundle | file | N | The zip file containing all of the resources to import into the application |  | undefined |
| email | string | N | Email address to notify the user when the job to import the application resources has completed or errored, defaults to the email address of the user making the request |  | email@example.com |
| options | [Application Import Options](_schemas.md#application-import-options) | N | Additional import options |  | [Application Import Options Example](_schemas.md#application-import-options-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](_schemas.md#application) | Updated application information |
| 202 | [Job Enqueued API Result](_schemas.md#job-enqueued-api-result) | If a job was enqueued for the resources to be imported into the application |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |

<br/>

## Import Logs

Retrieves information on application import logs

```ruby
result = client.application.import_logs(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.importLogs.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| limit | string | N | Max log entries to return (ordered by time descending) | 1 | 10 |
| since | string | N | Look for log entries since this time (ms since epoch) |  | 1465790400000 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Import Executions](_schemas.md#application-import-executions) | Application log objects |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Mqtt Publish Message

Publishes the given message to the given MQTT topic

```ruby
result = client.application.mqtt_publish_message(
  applicationId: my_application_id,
  payload: my_payload)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.mqttPublishMessage.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| payload | [MQTT Publish Body](_schemas.md#mqtt-publish-body) | Y | Object containing topic and message |  | [MQTT Publish Body Example](_schemas.md#mqtt-publish-body-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](_schemas.md#success) | Message successfully published |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Notebook Minute Counts

Returns notebook execution usage by day for the time range specified for this application

```ruby
result = client.application.notebook_minute_counts(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.notebookMinuteCounts.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| start | string | N | Start of range for notebook execution query (ms since epoch) |  | 0 |
| end | string | N | End of range for notebook execution query (ms since epoch) |  | 1465790400000 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Notebook Minute Counts](_schemas.md#notebook-minute-counts) | Notebook usage information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Patch

Updates information about an application

```ruby
result = client.application.patch(
  applicationId: my_application_id,
  application: my_application)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, application.*, or application.patch.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| application | [Application Patch](_schemas.md#application-patch) | Y | Object containing new application properties |  | [Application Patch Example](_schemas.md#application-patch-example) |
| summaryExclude | string | N | Comma-separated list of summary fields to exclude from application summary |  | payloadCount |
| summaryInclude | string | N | Comma-separated list of summary fields to include in application summary |  | payloadCount |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](_schemas.md#application) | Updated application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Payload Counts

Returns payload counts for the time range specified for this application

```ruby
result = client.application.payload_counts(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.payloadCounts.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| start | string | N | Start of range for payload count query (ms since epoch) | -2592000000 | 0 |
| end | string | N | End of range for payload count query (ms since epoch) | 0 | 1465790400000 |
| asBytes | string | N | If the resulting stats should be returned as bytes | false | true |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Stats](_schemas.md#payload-stats) | Payload counts, by type and source |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Payload Counts Breakdown

Returns payload counts per resolution in the time range specified for this application

```ruby
result = client.application.payload_counts_breakdown(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.payloadCountsBreakdown.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| start | string | N | Start of range for payload count query (ms since epoch) |  | 0 |
| end | string | N | End of range for payload count query (ms since epoch) |  | 1465790400000 |
| resolution | string | N | Resolution in milliseconds. Accepted values are: 86400000, 3600000 | 86400000 | 86400000 |
| asBytes | string | N | If the resulting stats should be returned as bytes | false | true |
| includeNonBillable | string | N | If non-billable payloads should be included in the result | false | true |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts Breakdown](_schemas.md#payload-counts-breakdown) | Sum of payload counts by date |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Readme

Get the current application readme information

```ruby
result = client.application.readme(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.cli, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.cli, all.User.read, application.*, or application.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Readme](_schemas.md#application-readme) | The application readme information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Readme Patch

Update the current application readme information

```ruby
result = client.application.readme_patch(
  applicationId: my_application_id,
  readme: my_readme)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, application.*, or application.patch.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| readme | [Application Readme Patch](_schemas.md#application-readme-patch) | Y | Object containing new readme information |  | [Application Readme Patch Example](_schemas.md#application-readme-patch-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Readme](_schemas.md#application-readme) | Updated readme information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Search

Search across an application&#x27;s resources by target identifier

```ruby
result = client.application.search(
  applicationId: my_application_id,
  filter: my_filter)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.search.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID of the associated application |  | 575ec8687ae143cd83dc4a97 |
| filter | string | Y | The partial resource name being searched for |  | my dev |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Search Result](_schemas.md#application-search-result) | An array of resource ids, names, descriptions, and types matching the search query |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application is not found |
