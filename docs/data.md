# Data

## Actions

*   [Time Series Query](#time-series-query)
*   [Last Value Query](#last-value-query)

### Time Series Query

Returns the data for the given query

```ruby
client.data.time_series_query(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| query | [timeSeriesQuery](_schemas.md#timeseriesquery) | Y | The query parameters |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [timeSeriesData](_schemas.md#timeseriesdata) | Data for requested time range |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

### Last Value Query

Returns the last known data for the given attribute

```ruby
client.data.last_value_query(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| query | [lastValueQuery](_schemas.md#lastvaluequery) | Y | The query parameters |
| _actions | boolean | N | Return resource actions in response |
| _links | boolean | N | Return resource link in response |
| _embedded | boolean | N | Return embedded resources in response |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [lastValueData](_schemas.md#lastvaluedata) | Last known data for the requested attribute |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |
