# Device Recipe Actions

Details on the various actions that can be performed on the
Device Recipe resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Patch](#patch)
*   [Delete](#delete)
*   [Bulk Create](#bulk-create)

<br/>

## Get

Retrieves information on a device recipe

```ruby
client.device_recipe.get(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceRecipe](_schemas.md#devicerecipe) | Device recipe information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

<br/>

## Patch

Updates information about a device recipe

```ruby
client.device_recipe.patch(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |
| deviceRecipe | [deviceRecipePatch](_schemas.md#devicerecipepatch) | Y | Object containing new properties of the device recipe |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [deviceRecipe](_schemas.md#devicerecipe) | Updated device recipe information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [error](_schemas.md#error) | Error if malformed request |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

<br/>

## Delete

Deletes a device recipe

```ruby
client.device_recipe.delete(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [success](_schemas.md#success) | If device recipe was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |

<br/>

## Bulk Create

Bulk creates devices using this recipe from a CSV

```ruby
client.device_recipe.bulk_create(params)
```

#### Available Parameters

| Name | Type | Required | Description |
| ---- | ---- | -------- | ----------- |
| applicationId | string | Y | ID associated with the application |
| deviceRecipeId | string | Y | ID associated with the device recipe |
| bulkInfo | [deviceRecipeBulkCreatePost](_schemas.md#devicerecipebulkcreatepost) | Y | Object containing bulk creation info |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [deviceRecipeBulkCreate](_schemas.md#devicerecipebulkcreate) | If devices were sucessfully created |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [error](_schemas.md#error) | Error if device recipe was not found |
