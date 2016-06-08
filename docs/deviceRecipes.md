# Device Recipes Actions

Details on the various actions that can be performed on the
Device Recipes resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the device recipes for an application

```ruby
client.device_recipes.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| sortField | string | N |  |
| sortDirection | string | N |  |
| page | string | N |  |
| perPage | string | N |  |
| filterField | string | N |  |
| filter | string | N |  |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceRecipes](_schemas.md#devicerecipes) | Collection of device recipes |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new device recipe for an application

```ruby
client.device_recipes.post(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipe | [deviceRecipePost](_schemas.md#devicerecipepost) | Y | New device recipe information |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [deviceRecipe](_schemas.md#devicerecipe) | Successfully created device recipe |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if application was not found |
