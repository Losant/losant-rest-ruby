# Instance Audit Logs Actions

Details on the various actions that can be performed on the
Instance Audit Logs resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)

<br/>

## Get

Returns the audit logs for the instance

```ruby
result = client.instance_audit_logs.get(instanceId: my_instance_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Instance, all.Instance.read, all.User, all.User.read, instanceAuditLogs.*, or instanceAuditLogs.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| instanceId | string | Y | ID associated with the instance |  | 575ec7417ae143cd83dc4a96 |
| sortField | string | N | Field to sort the results by. Accepted values are: creationDate, responseStatus, actorName | creationDate | creationDate |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | desc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 100 | 10 |
| start | string | N | Start of time range for audit log query |  | 1465790400000 |
| end | string | N | End of time range for audit log query |  | 1465790400000 |
| auditLogFilter | [Instance Audit Log Filter](_schemas.md#instance-audit-log-filter) | N | Filters for the audit log query |  | [Instance Audit Log Filter Example](_schemas.md#instance-audit-log-filter-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Instance Audit Logs](_schemas.md#instance-audit-logs) | Collection of instance audit logs |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if instance was not found |
