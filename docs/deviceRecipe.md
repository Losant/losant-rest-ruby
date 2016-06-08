# Device Recipe

## Actions

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Bulk Create](#bulk-create)

### Get

Retrieves information on a device recipe

```ruby
client.device_recipe.get(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceRecipe](_schemas.md#devicerecipe) | Device recipe information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

### Patch

Updates information about a device recipe

```ruby
client.device_recipe.patch(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |
| deviceRecipe | [deviceRecipePatch](_schemas.md#devicerecipepatch) | Y | Object containing new properties of the device recipe |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceRecipe](_schemas.md#devicerecipe) | Updated device recipe information |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

### Delete

Deletes a device recipe

```ruby
client.device_recipe.delete(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If device recipe was successfully deleted |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

### Bulk Create

Bulk creates devices using this recipe from a CSV

```ruby
client.device_recipe.bulk_create(params)
```

#### Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |
| bulkInfo | [deviceRecipeBulkCreatePost](_schemas.md#devicerecipebulkcreatepost) | Y | Object containing bulk creation info |

#### Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [deviceRecipeBulkCreate](_schemas.md#devicerecipebulkcreate) | If devices were sucessfully created |

#### Errors

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |
