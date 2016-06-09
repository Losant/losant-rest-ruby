# Data Actions

Details on the various actions that can be performed on the
Data resource, including the expected
parameters and the potential responses.

##### Contents

*   [Time Series Query](#time-series-query)
*   [Last Value Query](#last-value-query)

<br/>

## Time Series Query

Returns the data for the given query

```ruby
client.data.time_series_query(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| query | [timeSeriesQuery](_schemas.md#timeseriesquery) | Y | The query parameters |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [timeSeriesData](_schemas.md#timeseriesdata) | Data for requested time range |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Last Value Query

Returns the last known data for the given attribute

```ruby
client.data.last_value_query(params)
```

#### Available Parameters

| Name | Type | Required | Description | Default |
| ---- | ---- | -------- | ----------- | ------- |
| applicationId | string | Y | ID associated with the application |  |
| query | [lastValueQuery](_schemas.md#lastvaluequery) | Y | The query parameters |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [lastValueData](_schemas.md#lastvaluedata) | Last known data for the requested attribute |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
