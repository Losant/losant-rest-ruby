# Schemas

*   [Access Token](#access-token)
*   [Access Token Patch](#access-token-patch)
*   [Access Token Post](#access-token-post)
*   [Access Tokens](#access-tokens)
*   [Application](#application)
*   [Application Key](#application-key)
*   [Application Key Patch](#application-key-patch)
*   [Application Key Post](#application-key-post)
*   [Application Keys](#application-keys)
*   [Application Patch](#application-patch)
*   [Application Post](#application-post)
*   [Applications](#applications)
*   [Authenticated Device](#authenticated-device)
*   [Authenticated User](#authenticated-user)
*   [Dashboard](#dashboard)
*   [Dashboard Patch](#dashboard-patch)
*   [Dashboard Post](#dashboard-post)
*   [Dashboards](#dashboards)
*   [Device](#device)
*   [Device Command](#device-command)
*   [Device Commands](#device-commands)
*   [Device Credentials](#device-credentials)
*   [Device Log](#device-log)
*   [Device Patch](#device-patch)
*   [Device Post](#device-post)
*   [Device Recipe](#device-recipe)
*   [Device Recipe Bulk Create](#device-recipe-bulk-create)
*   [Device Recipe Bulk Create Post](#device-recipe-bulk-create-post)
*   [Device Recipe Patch](#device-recipe-patch)
*   [Device Recipe Post](#device-recipe-post)
*   [Device Recipes](#device-recipes)
*   [Device State](#device-state)
*   [Device States](#device-states)
*   [Device Tag Filter](#device-tag-filter)
*   [Devices](#devices)
*   [Disable Two Factor Auth](#disable-two-factor-auth)
*   [Enable Two Factor Auth](#enable-two-factor-auth)
*   [Error](#error)
*   [Event](#event)
*   [Event Patch](#event-patch)
*   [Event Post](#event-post)
*   [Events](#events)
*   [Workflow](#workflow)
*   [Workflow Log](#workflow-log)
*   [Workflow Patch](#workflow-patch)
*   [Workflow Post](#workflow-post)
*   [Workflow Storage Entries](#workflow-storage-entries)
*   [Workflow Storage Entry](#workflow-storage-entry)
*   [Workflows](#workflows)
*   [Github Login](#github-login)
*   [Last Value Data](#last-value-data)
*   [Last Value Query](#last-value-query)
*   [Me](#me)
*   [Me Patch](#me-patch)
*   [Multi Device Command](#multi-device-command)
*   [Organization](#organization)
*   [Organization Invitation Post](#organization-invitation-post)
*   [Organization Invitations](#organization-invitations)
*   [Organization Member Patch](#organization-member-patch)
*   [Organization Patch](#organization-patch)
*   [Organization Post](#organization-post)
*   [Organizations](#organizations)
*   [Recent Item](#recent-item)
*   [Recent Item List](#recent-item-list)
*   [Success](#success)
*   [Time Series Data](#time-series-data)
*   [Time Series Query](#time-series-query)
*   [User Credentials](#user-credentials)
*   [Virtual Button Press](#virtual-button-press)
*   [Webhook](#webhook)
*   [Webhook Patch](#webhook-patch)
*   [Webhook Post](#webhook-post)
*   [Webhooks](#webhooks)

## Access Token

Schema for a single Access Token

### Schema <a name="access-token-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "accessTokenId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "expirationDate": {
      "type": "string",
      "format": "date-time"
    },
    "scope": {
      "type": "array",
      "items": {
        "type": "string"
      }
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  }
}
```
### Example <a name="access-token-example"></a>

```json
{
  "id": "575ec7417ae143cd83dc4a95",
  "accessTokenId": "575ec7417ae143cd83dc4a95",
  "userId": "575ed70c7ae143cd83dc4aa9",
  "name": "My Access Token",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "expirationDate": "2017-06-13T04:00:00.000Z",
  "scope": [
    "devices",
    "devices.state"
  ],
  "status": "active",
  "token": "the_actual_token_string"
}
```

<br/>

## Access Token Patch

Schema for the body of an Access Token modification request

### Schema <a name="access-token-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    }
  },
  "additionalProperties": false
}
```
### Example <a name="access-token-patch-example"></a>

```json
{
  "name": "My Updated Access Token",
  "status": "inactive"
}
```

<br/>

## Access Token Post

Schema for the body of an Access Token creation request

### Schema <a name="access-token-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "expirationDate": {
      "type": "string",
      "format": "date-time"
    },
    "scope": {
      "type": "array",
      "items": {
        "type": "string"
      }
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="access-token-post-example"></a>

```json
{
  "name": "My New Access Token",
  "expirationDate": "2017-06-13T04:00:00.000Z",
  "scope": [
    "devices",
    "devices.state"
  ],
  "status": "active"
}
```

<br/>

## Access Tokens

Schema for a collection of Access Tokens

### Schema <a name="access-tokens-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Access Token",
        "description": "Schema for a single Access Token",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "accessTokenId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "userId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "expirationDate": {
            "type": "string",
            "format": "date-time"
          },
          "scope": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "status": {
            "type": "string",
            "enum": [
              "active",
              "inactive"
            ]
          },
          "token": {
            "type": "string",
            "minLength": 1
          }
        }
      }
    },
    "count": {
      "type": "integer"
    }
  }
}
```
### Example <a name="access-tokens-example"></a>

```json
{
  "items": [
    {
      "id": "575ec7417ae143cd83dc4a95",
      "accessTokenId": "575ec7417ae143cd83dc4a95",
      "userId": "575ed70c7ae143cd83dc4aa9",
      "name": "My Access Token",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "expirationDate": "2017-06-13T04:00:00.000Z",
      "scope": [
        "devices",
        "devices.state"
      ],
      "status": "active",
      "token": "the_actual_token_string"
    }
  ],
  "count": 1
}
```

<br/>

## Application

Schema for a single Application

### Schema <a name="application-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "user",
        "organization"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "summary": {
      "type": "object",
      "properties": {
        "deviceCount": {
          "type": "number"
        },
        "flowCount": {
          "type": "number"
        },
        "webhookCount": {
          "type": "number"
        },
        "eventCount": {
          "type": "number"
        },
        "keyCount": {
          "type": "number"
        },
        "deviceRecipeCount": {
          "type": "number"
        }
      }
    }
  }
}
```
### Example <a name="application-example"></a>

```json
{
  "id": "575ec8687ae143cd83dc4a97",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "ownerId": "575ed70c7ae143cd83dc4aa9",
  "ownerType": "user",
  "name": "My Application",
  "description": "The is the best application description",
  "summary": {
    "deviceCount": 5,
    "flowCount": 2,
    "webhookCount": 0,
    "eventCount": 0,
    "keyCount": 1,
    "deviceRecipeCount": 0
  }
}
```

<br/>

## Application Key

Schema for a single Application Key

### Schema <a name="application-key-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationKeyId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "key": {
      "type": "string"
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "secret": {
      "type": "string"
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      }
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  }
}
```
### Example <a name="application-key-example"></a>

```json
{
  "id": "575ec76c7ae143cd83dc4a96",
  "applicationKeyId": "575ec76c7ae143cd83dc4a96",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "key": "this_would_be_the_key",
  "status": "active",
  "description": "An example key description"
}
```

<br/>

## Application Key Patch

Schema for the body of an Application Key modification request

### Schema <a name="application-key-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ]
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```
### Example <a name="application-key-patch-example"></a>

```json
{
  "status": "active",
  "description": "An example updated key description"
}
```

<br/>

## Application Key Post

Schema for the body of an Application Key creation request

### Schema <a name="application-key-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      }
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```
### Example <a name="application-key-post-example"></a>

```json
{
  "description": "An example new key description"
}
```

<br/>

## Application Keys

Schema for a collection of Application Keys

### Schema <a name="application-keys-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Application Key",
        "description": "Schema for a single Application Key",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationKeyId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "key": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "active",
              "inactive"
            ]
          },
          "secret": {
            "type": "string"
          },
          "deviceIds": {
            "type": "array",
            "items": {
              "type": "string",
              "pattern": "^[A-Fa-f\\d]{24}$"
            }
          },
          "deviceTags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "additionalProperties": false
            }
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="application-keys-example"></a>

```json
{
  "items": [
    {
      "id": "575ec76c7ae143cd83dc4a96",
      "applicationKeyId": "575ec76c7ae143cd83dc4a96",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "key": "this_would_be_the_key",
      "status": "active",
      "description": "An example key description"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "key",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>

## Application Patch

Schema for the body of an Application modification request

### Schema <a name="application-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```
### Example <a name="application-patch-example"></a>

```json
{
  "name": "My Updated Application",
  "description": "Description of my updated application"
}
```

<br/>

## Application Post

Schema for the body of an Application creation request

### Schema <a name="application-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="application-post-example"></a>

```json
{
  "name": "My New Application",
  "description": "Description of my new application"
}
```

<br/>

## Applications

Schema for a collection of Applications

### Schema <a name="applications-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Application",
        "description": "Schema for a single Application",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "ownerId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerType": {
            "type": "string",
            "enum": [
              "user",
              "organization"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "summary": {
            "type": "object",
            "properties": {
              "deviceCount": {
                "type": "number"
              },
              "flowCount": {
                "type": "number"
              },
              "webhookCount": {
                "type": "number"
              },
              "eventCount": {
                "type": "number"
              },
              "keyCount": {
                "type": "number"
              },
              "deviceRecipeCount": {
                "type": "number"
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```
### Example <a name="applications-example"></a>

```json
{
  "items": [
    {
      "id": "575ec8687ae143cd83dc4a97",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "ownerId": "575ed70c7ae143cd83dc4aa9",
      "ownerType": "user",
      "name": "My Application",
      "description": "The is the best application description",
      "summary": {
        "deviceCount": 5,
        "flowCount": 2,
        "webhookCount": 0,
        "eventCount": 0,
        "keyCount": 1,
        "deviceRecipeCount": 0
      }
    }
  ],
  "count": 1,
  "totalCount": 8,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>

## Authenticated Device

Schema for the sucessful response when authenticating a Device

### Schema <a name="authenticated-device-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "devicecClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "applicationId",
    "deviceId",
    "deviceClass",
    "token"
  ]
}
```
### Example <a name="authenticated-device-example"></a>

```json
{
  "applicationId": "575ec8687ae143cd83dc4a97",
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "devicecClass": "standalone",
  "token": "token_to_use_for_authenticating_subsequent_requests"
}
```

<br/>

## Authenticated User

Schema for the sucessful response when authenticating a User

### Schema <a name="authenticated-user-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "token": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "userId",
    "token"
  ]
}
```
### Example <a name="authenticated-user-example"></a>

```json
{
  "userId": "575ed70c7ae143cd83dc4aa9",
  "token": "token_to_use_for_authenticating_subsequent_requests"
}
```

<br/>

## Dashboard

Schema for a single Dashboard

### Schema <a name="dashboard-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "dashboardId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "ownerId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "ownerType": {
      "type": "string",
      "enum": [
        "user",
        "organization"
      ]
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "public": {
      "type": "boolean"
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "blockType": {
            "type": "string"
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "integer"
          },
          "startY": {
            "type": "integer"
          },
          "width": {
            "type": "integer"
          },
          "height": {
            "type": "integer"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "id",
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ]
      }
    }
  }
}
```
### Example <a name="dashboard-example"></a>

```json
{
  "id": "575ece2b7ae143cd83dc4a9b",
  "dashboardId": "575ece2b7ae143cd83dc4a9b",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "ownerId": "575ed70c7ae143cd83dc4aa9",
  "ownerType": "user",
  "name": "My Dashboard",
  "description": "The best dashboard description",
  "refreshRate": 60,
  "public": false,
  "blocks": []
}
```

<br/>

## Dashboard Patch

Schema for the body of a Dashboard modification request

### Schema <a name="dashboard-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "blockType": {
            "type": "string"
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "integer"
          },
          "startY": {
            "type": "integer"
          },
          "width": {
            "type": "integer"
          },
          "height": {
            "type": "integer"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "id",
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ]
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "public": {
      "type": "boolean"
    }
  },
  "additionalProperties": false
}
```
### Example <a name="dashboard-patch-example"></a>

```json
{
  "name": "My Updated Dashboard",
  "description": "Description of my updated dashboard",
  "refreshRate": 300,
  "public": true
}
```

<br/>

## Dashboard Post

Schema for the body of a Dashboard creation request

### Schema <a name="dashboard-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "blocks": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "blockType": {
            "type": "string"
          },
          "title": {
            "type": "string",
            "maxLength": 255
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "startX": {
            "type": "integer"
          },
          "startY": {
            "type": "integer"
          },
          "width": {
            "type": "integer"
          },
          "height": {
            "type": "integer"
          },
          "config": {
            "type": "object"
          }
        },
        "required": [
          "id",
          "blockType",
          "startX",
          "startY",
          "width",
          "height"
        ]
      }
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "refreshRate": {
      "type": "number",
      "minimum": 5,
      "maximum": 600
    },
    "public": {
      "type": "boolean"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="dashboard-post-example"></a>

```json
{
  "name": "My New Dashboard",
  "public": false
}
```

<br/>

## Dashboards

Schema for a collection of Dashboards

### Schema <a name="dashboards-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Dashboard",
        "description": "Schema for a single Dashboard",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "dashboardId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "ownerId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "ownerType": {
            "type": "string",
            "enum": [
              "user",
              "organization"
            ]
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "refreshRate": {
            "type": "number",
            "minimum": 5,
            "maximum": 600
          },
          "public": {
            "type": "boolean"
          },
          "blocks": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string"
                },
                "blockType": {
                  "type": "string"
                },
                "title": {
                  "type": "string",
                  "maxLength": 255
                },
                "applicationId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "startX": {
                  "type": "integer"
                },
                "startY": {
                  "type": "integer"
                },
                "width": {
                  "type": "integer"
                },
                "height": {
                  "type": "integer"
                },
                "config": {
                  "type": "object"
                }
              },
              "required": [
                "id",
                "blockType",
                "startX",
                "startY",
                "width",
                "height"
              ]
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```
### Example <a name="dashboards-example"></a>

```json
{
  "items": [
    {
      "id": "575ece2b7ae143cd83dc4a9b",
      "dashboardId": "575ece2b7ae143cd83dc4a9b",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "ownerId": "575ed70c7ae143cd83dc4aa9",
      "ownerType": "user",
      "name": "My Dashboard",
      "description": "The best dashboard description",
      "refreshRate": 60,
      "public": false,
      "blocks": []
    }
  ],
  "count": 1,
  "totalCount": 5,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>

## Device

Schema for a single Device

### Schema <a name="device-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "connectionInfo": {
      "type": "object",
      "properties": {
        "time": {
          "type": "string",
          "format": "date-time"
        },
        "connected": {
          "enum": [
            1,
            0,
            null
          ]
        }
      }
    }
  }
}
```
### Example <a name="device-example"></a>

```json
{
  "id": "575ecf887ae143cd83dc4aa2",
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Device",
  "description": "A device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    },
    {
      "key": "floor",
      "value": "8"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone",
  "connectionInfo": {
    "time": "2016-06-14T08:15:00.000Z",
    "connected": 1
  }
}
```

<br/>

## Device Command

Schema for a command for a single Device

### Schema <a name="device-command-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "payload": {}
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```
### Example <a name="device-command-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "name": "myCommand",
  "payload": [
    1,
    1,
    2,
    3,
    5
  ]
}
```

<br/>

## Device Commands

Schema for an array of Device Commands

### Schema <a name="device-commands-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "title": "Device Command",
    "description": "Schema for a command for a single Device",
    "type": "object",
    "properties": {
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "name": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      },
      "payload": {}
    },
    "required": [
      "name"
    ],
    "additionalProperties": false
  }
}
```
### Example <a name="device-commands-example"></a>

```json
[
  {
    "time": "2016-06-13T04:00:00.000Z",
    "name": "myCommand",
    "payload": [
      1,
      1,
      2,
      3,
      5
    ]
  },
  {
    "time": "2016-06-13T04:00:00.000Z",
    "name": "myCommand",
    "payload": [
      1,
      1,
      2,
      3,
      5
    ]
  }
]
```

<br/>

## Device Credentials

Schema for the body of a Device authentication request

### Schema <a name="device-credentials-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "deviceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "key": {
      "type": "string"
    },
    "secret": {
      "type": "string"
    }
  },
  "required": [
    "deviceId",
    "key",
    "secret"
  ],
  "additionalProperties": false
}
```
### Example <a name="device-credentials-example"></a>

```json
{
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "key": "this_would_be_the_key",
  "secret": "this_would_be_the_secret"
}
```

<br/>

## Device Log

Log of connection information for a Device

### Schema <a name="device-log-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "connected": {
        "enum": [
          1,
          0
        ]
      },
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "disconnectReason": {
        "type": "string"
      },
      "messagesFromClient": {
        "type": "number"
      },
      "messagesToClient": {
        "type": "number"
      }
    }
  }
}
```
### Example <a name="device-log-example"></a>

```json
[
  {
    "connected": 1,
    "time": "2016-06-03T00:56:22.447Z"
  },
  {
    "connected": 0,
    "disconnectReason": "Connection Lost",
    "messagesFromClient": 2548,
    "messagesToClient": 0,
    "time": "2016-06-03T00:56:21.028Z"
  },
  {
    "connected": 1,
    "time": "2016-06-01T06:24:39.190Z"
  },
  {
    "connected": 0,
    "disconnectReason": "Connection Lost",
    "messagesFromClient": 479,
    "messagesToClient": 0,
    "time": "2016-06-01T06:24:37.925Z"
  },
  {
    "connected": 1,
    "time": "2016-05-31T22:24:48.777Z"
  }
]
```

<br/>

## Device Patch

Schema for the body of a Device modification request

### Schema <a name="device-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false
}
```
### Example <a name="device-patch-example"></a>

```json
{
  "name": "My Updated Device",
  "description": "Description of my updated device",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>

## Device Post

Schema for the body of a Device creation request

### Schema <a name="device-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="device-post-example"></a>

```json
{
  "name": "My New Device",
  "description": "Description of my new device",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>

## Device Recipe

Schema for a single Device Recipe

### Schema <a name="device-recipe-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "deviceRecipeId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="device-recipe-example"></a>

```json
{
  "id": "575ecec57ae143cd83dc4a9f",
  "deviceRecipeId": "575ecec57ae143cd83dc4a9f",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "Actual recipe name",
  "deviceName": "Future device name",
  "description": "My recipe description",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>

## Device Recipe Bulk Create

Schema for the result of a bulk Device creation request

### Schema <a name="device-recipe-bulk-create-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "created": {
      "type": "number"
    },
    "failed": {
      "type": "number"
    },
    "csvResult": {
      "type": "string"
    }
  }
}
```
### Example <a name="device-recipe-bulk-create-example"></a>

```json
{
  "created": 10,
  "failed": 0,
  "csvResult": "a,comma,separated,string,of,results"
}
```

<br/>

## Device Recipe Bulk Create Post

Schema for the body of a bulk Device creation request

### Schema <a name="device-recipe-bulk-create-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "nameColumn": {
      "type": "string"
    },
    "descriptionColumn": {
      "type": "string"
    },
    "csv": {
      "type": "string"
    }
  },
  "additionalProperties": false,
  "required": [
    "csv"
  ]
}
```
### Example <a name="device-recipe-bulk-create-post-example"></a>

```json
{
  "nameColumn": "myNameColumn",
  "descriptionColumn": "column2",
  "csv": "a,comma,separated,string,of,input,data"
}
```

<br/>

## Device Recipe Patch

Schema for the body of a Device Recipe modification request

### Schema <a name="device-recipe-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false
}
```
### Example <a name="device-recipe-patch-example"></a>

```json
{
  "name": "My Updated Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my updated device recipe",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>

## Device Recipe Post

Schema for the body of a Device Recipe creation request

### Schema <a name="device-recipe-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "deviceName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "deviceDescription": {
      "type": "string",
      "maxLength": 32767
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "required": [
          "key",
          "value"
        ],
        "additionalProperties": false
      }
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "dataType": {
            "type": "string",
            "enum": [
              "string",
              "number",
              "gps",
              "boolean"
            ]
          }
        },
        "required": [
          "name",
          "dataType"
        ],
        "additionalProperties": false
      }
    },
    "deviceClass": {
      "type": "string",
      "enum": [
        "standalone",
        "master",
        "owned",
        "floating",
        "virtual"
      ]
    },
    "masterId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="device-recipe-post-example"></a>

```json
{
  "name": "My New Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my new device recipe",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```

<br/>

## Device Recipes

Schema for a collection of Device Recipes

### Schema <a name="device-recipes-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Device Recipe",
        "description": "Schema for a single Device Recipe",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceRecipeId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "deviceName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "deviceDescription": {
            "type": "string",
            "maxLength": 32767
          },
          "tags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "required": [
                "key",
                "value"
              ],
              "additionalProperties": false
            }
          },
          "attributes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "dataType": {
                  "type": "string",
                  "enum": [
                    "string",
                    "number",
                    "gps",
                    "boolean"
                  ]
                }
              },
              "required": [
                "name",
                "dataType"
              ],
              "additionalProperties": false
            }
          },
          "deviceClass": {
            "type": "string",
            "enum": [
              "standalone",
              "master",
              "owned",
              "floating",
              "virtual"
            ]
          },
          "masterId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="device-recipes-example"></a>

```json
{
  "items": [
    {
      "id": "575ecec57ae143cd83dc4a9f",
      "deviceRecipeId": "575ecec57ae143cd83dc4a9f",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "Actual recipe name",
      "deviceName": "Future device name",
      "description": "My recipe description",
      "deviceDescription": "Future device description",
      "tags": [
        {
          "key": "TagKey",
          "value": "TagValue"
        }
      ],
      "attributes": [
        {
          "name": "voltage",
          "dataType": "number"
        }
      ],
      "deviceClass": "standalone"
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>

## Device State

Schema for a single Device state

### Schema <a name="device-state-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "type": "string",
      "format": "date-time"
    },
    "relayId": {
      "type": "string"
    },
    "data": {
      "type": "object",
      "patternProperties": {
        "^[0-9a-zA-Z_-]{1,255}$": {
          "type": [
            "number",
            "string",
            "boolean"
          ]
        }
      },
      "additionalProperties": false
    }
  },
  "required": [
    "data"
  ],
  "additionalProperties": false
}
```
### Example <a name="device-state-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "voltage": 22.4
  }
}
```

<br/>

## Device States

Schema for an array of Device states

### Schema <a name="device-states-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "title": "Device State",
    "description": "Schema for a single Device state",
    "type": "object",
    "properties": {
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "relayId": {
        "type": "string"
      },
      "data": {
        "type": "object",
        "patternProperties": {
          "^[0-9a-zA-Z_-]{1,255}$": {
            "type": [
              "number",
              "string",
              "boolean"
            ]
          }
        },
        "additionalProperties": false
      }
    },
    "required": [
      "data"
    ],
    "additionalProperties": false
  }
}
```
### Example <a name="device-states-example"></a>

```json
[
  {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "voltage": 22.4
    }
  }
]
```

<br/>

## Device Tag Filter

Array of Tags for filtering devices. Tag keys and tag values are optional.

### Schema <a name="device-tag-filter-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "key": {
        "type": "string",
        "pattern": "^[0-9a-zA-Z_-]{1,255}$"
      },
      "value": {
        "type": "string",
        "minLength": 1,
        "maxLength": 255
      }
    },
    "additionalProperties": false
  }
}
```
### Example <a name="device-tag-filter-example"></a>

```json
[
  {
    "value": "red"
  },
  {
    "key": "floor",
    "value": 2
  }
]
```

<br/>

## Devices

Schema for a collection of Devices

### Schema <a name="devices-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Device",
        "description": "Schema for a single Device",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "deviceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "tags": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "value": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 255
                }
              },
              "required": [
                "key",
                "value"
              ],
              "additionalProperties": false
            }
          },
          "attributes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "dataType": {
                  "type": "string",
                  "enum": [
                    "string",
                    "number",
                    "gps",
                    "boolean"
                  ]
                }
              },
              "required": [
                "name",
                "dataType"
              ],
              "additionalProperties": false
            }
          },
          "deviceClass": {
            "type": "string",
            "enum": [
              "standalone",
              "master",
              "owned",
              "floating",
              "virtual"
            ]
          },
          "masterId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "connectionInfo": {
            "type": "object",
            "properties": {
              "time": {
                "type": "string",
                "format": "date-time"
              },
              "connected": {
                "enum": [
                  1,
                  0,
                  null
                ]
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="devices-example"></a>

```json
{
  "items": [
    {
      "id": "575ecf887ae143cd83dc4aa2",
      "deviceId": "575ecf887ae143cd83dc4aa2",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Device",
      "description": "A device description",
      "tags": [
        {
          "key": "TagKey",
          "value": "TagValue"
        },
        {
          "key": "floor",
          "value": "8"
        }
      ],
      "attributes": [
        {
          "name": "voltage",
          "dataType": "number"
        }
      ],
      "deviceClass": "standalone",
      "connectionInfo": {
        "time": "2016-06-14T08:15:00.000Z",
        "connected": 1
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>

## Disable Two Factor Auth

Schema for the body of a request to disable two factor auth

### Schema <a name="disable-two-factor-auth-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    }
  },
  "required": [
    "password",
    "twoFactorCode"
  ],
  "additionalProperties": false
}
```
### Example <a name="disable-two-factor-auth-example"></a>

```json
{
  "twoFactorCode": "123123",
  "password": "this would be your password"
}
```

<br/>

## Enable Two Factor Auth

Schema for the body of a request to enable two factor auth

### Schema <a name="enable-two-factor-auth-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "twoFactorAuthKey": {
      "type": "string",
      "minLength": 52,
      "maxLength": 52
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    }
  },
  "required": [
    "password",
    "twoFactorAuthKey"
  ],
  "additionalProperties": false
}
```
### Example <a name="enable-two-factor-auth-example"></a>

```json
{
  "twoFactorAuthKey": "HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA",
  "password": "this would be your password"
}
```

<br/>

## Error

Schema for errors returned by the API

### Schema <a name="error-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "type": {
      "type": "string"
    },
    "message": {
      "type": "string"
    }
  }
}
```
### Example <a name="error-example"></a>

```json
{
  "type": "NotFound",
  "message": "Application was not found"
}
```

<br/>

## Event

Schema for a single Event

### Schema <a name="event-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "eventId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "sourceType": {
      "type": "string",
      "enum": [
        "flow",
        "user",
        "device"
      ]
    },
    "sourceId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "level": {
      "type": "string",
      "enum": [
        "info",
        "warning",
        "error",
        "critical"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "subject": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "message": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {},
    "updates": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "sourceType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device"
            ]
          },
          "sourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "comment": {
            "type": "string",
            "maxLength": 32767
          },
          "data": {},
          "stateChange": {
            "type": "object",
            "properties": {
              "old": {
                "type": "string",
                "enum": [
                  "new",
                  "acknowledged",
                  "resolved"
                ]
              },
              "new": {
                "type": "string",
                "enum": [
                  "new",
                  "acknowledged",
                  "resolved"
                ]
              }
            }
          }
        }
      }
    }
  }
}
```
### Example <a name="event-example"></a>

```json
{
  "id": "575ed0de7ae143cd83dc4aa5",
  "eventId": "575ed0de7ae143cd83dc4aa5",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "sourceType": "user",
  "sourceId": "575ed70c7ae143cd83dc4aa9",
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds",
  "updates": []
}
```

<br/>

## Event Patch

Schema for the body of an Event modification request

### Schema <a name="event-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "comment": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {}
  },
  "additionalProperties": false
}
```
### Example <a name="event-patch-example"></a>

```json
{
  "state": "acknowledged",
  "comment": "Looking into this issue"
}
```

<br/>

## Event Post

Schema for the body of an Event creation request

### Schema <a name="event-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "level": {
      "type": "string",
      "enum": [
        "info",
        "warning",
        "error",
        "critical"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "subject": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "message": {
      "type": "string",
      "maxLength": 32767
    },
    "data": {}
  },
  "required": [
    "level",
    "state",
    "subject"
  ],
  "additionalProperties": false
}
```
### Example <a name="event-post-example"></a>

```json
{
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds"
}
```

<br/>

## Events

Schema for a collection of Events

### Schema <a name="events-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Event",
        "description": "Schema for a single Event",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "eventId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "sourceType": {
            "type": "string",
            "enum": [
              "flow",
              "user",
              "device"
            ]
          },
          "sourceId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "level": {
            "type": "string",
            "enum": [
              "info",
              "warning",
              "error",
              "critical"
            ]
          },
          "state": {
            "type": "string",
            "enum": [
              "new",
              "acknowledged",
              "resolved"
            ]
          },
          "subject": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "message": {
            "type": "string",
            "maxLength": 32767
          },
          "data": {},
          "updates": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "sourceType": {
                  "type": "string",
                  "enum": [
                    "flow",
                    "user",
                    "device"
                  ]
                },
                "sourceId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "creationDate": {
                  "type": "string",
                  "format": "date-time"
                },
                "comment": {
                  "type": "string",
                  "maxLength": 32767
                },
                "data": {},
                "stateChange": {
                  "type": "object",
                  "properties": {
                    "old": {
                      "type": "string",
                      "enum": [
                        "new",
                        "acknowledged",
                        "resolved"
                      ]
                    },
                    "new": {
                      "type": "string",
                      "enum": [
                        "new",
                        "acknowledged",
                        "resolved"
                      ]
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "state": {
      "type": "string",
      "enum": [
        "new",
        "acknowledged",
        "resolved"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="events-example"></a>

```json
{
  "items": [
    {
      "id": "575ed0de7ae143cd83dc4aa5",
      "eventId": "575ed0de7ae143cd83dc4aa5",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "sourceType": "user",
      "sourceId": "575ed70c7ae143cd83dc4aa9",
      "level": "info",
      "state": "new",
      "subject": "Power levels critical",
      "message": "Power levels on device 432 have surpassed critical thresholds",
      "updates": []
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "subject",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "state": "new"
}
```

<br/>

## Workflow

Schema for a single Workflow

### Schema <a name="workflow-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "flowId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "enabled": {
      "type": "boolean"
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "id",
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    },
    "stats": {
      "type": "object",
      "properties": {
        "runCount": {
          "type": "number"
        },
        "errorCount": {
          "type": "number"
        }
      }
    }
  }
}
```
### Example <a name="workflow-example"></a>

```json
{
  "id": "575ed18f7ae143cd83dc4aa6",
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Workflow",
  "description": "Description of my empty workflow",
  "enabled": true,
  "triggers": [],
  "nodes": [],
  "globals": [],
  "stats": {
    "runCount": 0,
    "errorCount": 0
  }
}
```

<br/>

## Workflow Log

Log of workflow run information

### Schema <a name="workflow-log-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "time": {
        "type": "string",
        "format": "date-time"
      },
      "errorCount": {
        "type": "number"
      },
      "pathsCompleted": {
        "type": "number"
      },
      "totalCount": {
        "type": "number"
      },
      "totalTime": {
        "type": "number"
      },
      "wallTime": {
        "type": "number"
      },
      "nodes": {
        "type": "object",
        "additionalProperties": {
          "type": "object",
          "properties": {
            "time": {
              "type": "number"
            },
            "count": {
              "type": "number"
            }
          }
        }
      },
      "errors": {
        "type": "array",
        "items": {}
      }
    }
  }
}
```
### Example <a name="workflow-log-example"></a>

```json
[
  {
    "time": "2016-06-03T00:56:22.447Z",
    "errorCount": 0,
    "pathsCompleted": 1,
    "totalCount": 1,
    "totalTime": 24,
    "wallTime": 450,
    "errors": [],
    "nodes": {
      "SJaEw_dV": {
        "time": 22,
        "count": 1
      }
    }
  },
  {
    "time": "2016-06-03T00:57:22.447Z",
    "errorCount": 0,
    "pathsCompleted": 1,
    "totalCount": 3,
    "totalTime": 58,
    "wallTime": 152,
    "errors": [],
    "nodes": {
      "SJaEw_dV": {
        "time": 18,
        "count": 3
      }
    }
  }
]
```

<br/>

## Workflow Patch

Schema for the body of a Workflow modification request

### Schema <a name="workflow-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "enabled": {
      "type": "boolean"
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "id",
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    }
  },
  "additionalProperties": false
}
```
### Example <a name="workflow-patch-example"></a>

```json
{
  "name": "My Updated Workflow",
  "description": "Description of my updated workflow",
  "enabled": false
}
```

<br/>

## Workflow Post

Schema for the body of a Workflow creation request

### Schema <a name="workflow-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "enabled": {
      "type": "boolean"
    },
    "triggers": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "type"
        ]
      }
    },
    "nodes": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "config": {
            "type": "object"
          },
          "meta": {
            "type": "object"
          },
          "outputIds": {
            "type": "array",
            "items": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          }
        },
        "additionalProperties": false,
        "required": [
          "id",
          "type"
        ]
      }
    },
    "globals": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "json": {
            "type": "string",
            "minLength": 1
          }
        },
        "additionalProperties": false,
        "required": [
          "key",
          "json"
        ]
      }
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="workflow-post-example"></a>

```json
{
  "name": "My New Workflow",
  "description": "Description of my new workflow"
}
```

<br/>

## Workflow Storage Entries

Set of persistent workflow storage values

### Schema <a name="workflow-storage-entries-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^.{1,255}$": {}
  }
}
```
### Example <a name="workflow-storage-entries-example"></a>

```json
{
  "myStorageKey": "hello",
  "other key": [
    13,
    21,
    34
  ]
}
```

<br/>

## Workflow Storage Entry

Schema for the body of a request to set a Workflow storage entry

### Schema <a name="workflow-storage-entry-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "key": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "value": {}
  },
  "additionalProperties": false,
  "required": [
    "key"
  ]
}
```
### Example <a name="workflow-storage-entry-example"></a>

```json
{
  "key": "myStorageKey",
  "value": 12
}
```

<br/>

## Workflows

Schema for a collection of Workflows

### Schema <a name="workflows-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Workflow",
        "description": "Schema for a single Workflow",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "flowId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "enabled": {
            "type": "boolean"
          },
          "triggers": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string"
                },
                "type": {
                  "type": "string"
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  }
                }
              },
              "additionalProperties": false,
              "required": [
                "type"
              ]
            }
          },
          "nodes": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "string"
                },
                "type": {
                  "type": "string"
                },
                "config": {
                  "type": "object"
                },
                "meta": {
                  "type": "object"
                },
                "outputIds": {
                  "type": "array",
                  "items": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  }
                }
              },
              "additionalProperties": false,
              "required": [
                "id",
                "type"
              ]
            }
          },
          "globals": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "key": {
                  "type": "string",
                  "pattern": "^[0-9a-zA-Z_-]{1,255}$"
                },
                "json": {
                  "type": "string",
                  "minLength": 1
                }
              },
              "additionalProperties": false,
              "required": [
                "key",
                "json"
              ]
            }
          },
          "stats": {
            "type": "object",
            "properties": {
              "runCount": {
                "type": "number"
              },
              "errorCount": {
                "type": "number"
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="workflows-example"></a>

```json
{
  "items": [
    {
      "id": "575ed18f7ae143cd83dc4aa6",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Workflow",
      "description": "Description of my empty workflow",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": [],
      "stats": {
        "runCount": 0,
        "errorCount": 0
      }
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>

## Github Login

Schema for the body of a Github login request

### Schema <a name="github-login-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "accessToken": {
      "type": "string",
      "minLength": 1
    }
  },
  "required": [
    "accessToken"
  ],
  "additionalProperties": false
}
```
### Example <a name="github-login-example"></a>

```json
{
  "accessToken": "the github access token"
}
```

<br/>

## Last Value Data

Schema for the result of a last value query

### Schema <a name="last-value-data-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "patternProperties": {
    "^[A-Fa-f\\d]{24}$": {
      "type": "object",
      "properties": {
        "time": {
          "type": "string",
          "format": "date-time"
        },
        "data": {
          "type": "object",
          "patternProperties": {
            "^[0-9a-zA-Z_-]{1,255}$": {
              "type": [
                "number",
                "string",
                "boolean"
              ]
            }
          },
          "additionalProperties": false
        }
      },
      "additionalProperties": false,
      "required": [
        "data",
        "time"
      ]
    }
  },
  "additionalProperties": false
}
```
### Example <a name="last-value-data-example"></a>

```json
{
  "575ecf887ae143cd83dc4aa2": {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "voltage": 12
    }
  },
  "575ef5c97ae143cd83dc4aac": {
    "time": "2016-06-12T08:30:00.000Z",
    "data": {
      "voltage": 19
    }
  }
}
```

<br/>

## Last Value Query

Schema for the body of a last value query request

### Schema <a name="last-value-query-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "attribute": {
      "type": "string",
      "pattern": "^[0-9a-zA-Z_-]{1,255}$"
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      }
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      }
    }
  },
  "additionalProperties": false
}
```
### Example <a name="last-value-query-example"></a>

```json
{
  "deviceIds": [
    "575ecf887ae143cd83dc4aa2",
    "575ef5c97ae143cd83dc4aac"
  ],
  "attribute": "voltage"
}
```

<br/>

## Me

Schema for information about the currently authenticated user

### Schema <a name="me-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "passwordLastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "emailVerified": {
      "type": "boolean"
    },
    "twoFactorAuthEnabled": {
      "type": "boolean"
    },
    "fullName": {
      "type": "string"
    },
    "githubName": {
      "type": "string"
    },
    "twitterName": {
      "type": "string"
    },
    "avatarUrl": {
      "type": "string",
      "format": "url"
    },
    "limits": {
      "application": {
        "type": "number"
      },
      "dashboard": {
        "type": "number"
      }
    },
    "recentDashboards": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "recentApplications": {
      "title": "Recent Item List",
      "description": "Schema for an array of recent items",
      "type": "object",
      "properties": {
        "itemType": {
          "type": "string",
          "enum": [
            "application",
            "device",
            "flow",
            "dashboard"
          ]
        },
        "parentId": {
          "type": "string",
          "pattern": "^[A-Fa-f\\d]{24}$"
        },
        "items": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "id": {
                "type": "string",
                "pattern": "^[A-Fa-f\\d]{24}$"
              },
              "name": {
                "type": "string",
                "minLength": 1,
                "maxLength": 255
              }
            }
          }
        }
      }
    },
    "defaults": {},
    "summary": {
      "type": "object",
      "properties": {
        "appCount": {
          "type": "number"
        },
        "dashCount": {
          "type": "number"
        },
        "orgCount": {
          "type": "number"
        }
      }
    }
  }
}
```
### Example <a name="me-example"></a>

```json
{
  "id": "575ed70c7ae143cd83dc4aa9",
  "userId": "575ed70c7ae143cd83dc4aa9",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "passwordLastUpdated": "2016-06-13T04:00:00.000Z",
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "emailVerified": true,
  "twoFactorAuthEnabled": false,
  "fullName": "Example Name",
  "summary": {
    "appCount": 8,
    "dashCount": 5,
    "orgCount": 2
  }
}
```

<br/>

## Me Patch

Schema for the body of request to modify the current user

### Schema <a name="me-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "firstName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "lastName": {
      "type": "string",
      "minLength": 1,
      "maxLength": 1024
    },
    "companyName": {
      "type": "string",
      "maxLength": 1024
    },
    "phoneNumber": {
      "type": "string",
      "maxLength": 1024
    },
    "location": {
      "type": "string",
      "maxLength": 1024
    },
    "url": {
      "type": "string",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    }
  },
  "additionalProperties": false
}
```
### Example <a name="me-patch-example"></a>

```json
{
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "password": "my new password"
}
```

<br/>

## Multi Device Command

Schema for the body of a request to send a command to multiple Devices

### Schema <a name="multi-device-command-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "time": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "payload": {},
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      }
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      }
    }
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```
### Example <a name="multi-device-command-example"></a>

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "name": "myCommand",
  "payload": [
    1,
    1,
    2,
    3,
    5
  ],
  "deviceTags": [
    {
      "key": "floor",
      "value": 8
    }
  ]
}
```

<br/>

## Organization

Schema for a single Organization

### Schema <a name="organization-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "orgId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    },
    "members": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "userId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "firstName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "lastName": {
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },
          "email": {
            "type": "string",
            "format": "email",
            "maxLength": 1024
          },
          "avatarUrl": {
            "type": "string",
            "format": "url"
          },
          "role": {
            "type": "string",
            "enum": [
              "admin",
              "edit",
              "view"
            ]
          }
        }
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "appCount": {
          "type": "number"
        },
        "dashCount": {
          "type": "number"
        }
      }
    }
  }
}
```
### Example <a name="organization-example"></a>

```json
{
  "id": "575ed6e87ae143cd83dc4aa8",
  "orgId": "575ed6e87ae143cd83dc4aa8",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Organization",
  "description": "My organization description",
  "members": [
    {
      "userId": "575ed70c7ae143cd83dc4aa9",
      "firstName": "Example",
      "lastName": "Name",
      "email": "example@losant.com",
      "role": "admin"
    },
    {
      "userId": "575ef90f7ae143cd83dc4aad",
      "firstName": "Other View",
      "lastName": "Only User",
      "email": "viewer@losant.com",
      "role": "view"
    }
  ],
  "summary": {
    "appCount": 2,
    "dashCount": 1
  }
}
```

<br/>

## Organization Invitation Post

Schema for the body of a request to send an invitation

### Schema <a name="organization-invitation-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "role": {
      "type": "string",
      "enum": [
        "admin",
        "edit",
        "view"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "email",
    "role"
  ]
}
```
### Example <a name="organization-invitation-post-example"></a>

```json
{
  "email": "invitedUser@losant.com",
  "role": "edit"
}
```

<br/>

## Organization Invitations

Schema for an array of pending invitations to an Organization

### Schema <a name="organization-invitations-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "id": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      },
      "email": {
        "type": "string",
        "format": "email",
        "maxLength": 1024
      },
      "role": {
        "type": "string",
        "enum": [
          "admin",
          "edit",
          "view"
        ]
      },
      "inviteDate": {
        "type": "string",
        "format": "date-time"
      },
      "ttl": {
        "type": "number"
      },
      "hasExpired": {
        "type": "boolean"
      }
    }
  }
}
```
### Example <a name="organization-invitations-example"></a>

```json
[
  {
    "id": "575ed71e7ae143cd83dc4aaa",
    "email": "invitedUser@losant.com",
    "role": "edit",
    "inviteDate": "2016-05-13T04:00:00.000Z",
    "ttl": 4233600000,
    "hasExpired": true
  }
]
```

<br/>

## Organization Member Patch

Schema for the body of a request to modify an Organization member

### Schema <a name="organization-member-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "userId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "role": {
      "type": "string",
      "enum": [
        "admin",
        "edit",
        "view"
      ]
    }
  },
  "additionalProperties": false,
  "required": [
    "userId",
    "role"
  ]
}
```
### Example <a name="organization-member-patch-example"></a>

```json
{
  "userId": "575ef90f7ae143cd83dc4aad",
  "role": "view"
}
```

<br/>

## Organization Patch

Schema for the body of an Organization modification request

### Schema <a name="organization-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```
### Example <a name="organization-patch-example"></a>

```json
{
  "name": "My Updated Organization",
  "description": "Description of my updated organization"
}
```

<br/>

## Organization Post

Schema for the body of an Organization creation request

### Schema <a name="organization-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "description": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false,
  "required": [
    "name"
  ]
}
```
### Example <a name="organization-post-example"></a>

```json
{
  "name": "My New Organization",
  "description": "Description of my new organization"
}
```

<br/>

## Organizations

Schema for a collection of Organizations

### Schema <a name="organizations-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Organization",
        "description": "Schema for a single Organization",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "orgId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "description": {
            "type": "string",
            "maxLength": 32767
          },
          "members": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "userId": {
                  "type": "string",
                  "pattern": "^[A-Fa-f\\d]{24}$"
                },
                "firstName": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "lastName": {
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 1024
                },
                "email": {
                  "type": "string",
                  "format": "email",
                  "maxLength": 1024
                },
                "avatarUrl": {
                  "type": "string",
                  "format": "url"
                },
                "role": {
                  "type": "string",
                  "enum": [
                    "admin",
                    "edit",
                    "view"
                  ]
                }
              }
            }
          },
          "summary": {
            "type": "object",
            "properties": {
              "appCount": {
                "type": "number"
              },
              "dashCount": {
                "type": "number"
              }
            }
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    }
  }
}
```
### Example <a name="organizations-example"></a>

```json
{
  "items": [
    {
      "id": "575ed6e87ae143cd83dc4aa8",
      "orgId": "575ed6e87ae143cd83dc4aa8",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Organization",
      "description": "My organization description",
      "members": [
        {
          "userId": "575ed70c7ae143cd83dc4aa9",
          "firstName": "Example",
          "lastName": "Name",
          "email": "example@losant.com",
          "role": "admin"
        },
        {
          "userId": "575ef90f7ae143cd83dc4aad",
          "firstName": "Other View",
          "lastName": "Only User",
          "email": "viewer@losant.com",
          "role": "view"
        }
      ],
      "summary": {
        "appCount": 2,
        "dashCount": 1
      }
    }
  ],
  "count": 1,
  "totalCount": 2,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc"
}
```

<br/>

## Recent Item

Schema for the body of a request to add a recent item

### Schema <a name="recent-item-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "itemType": {
      "type": "string",
      "enum": [
        "application",
        "device",
        "flow",
        "dashboard"
      ]
    },
    "parentId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "itemId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  },
  "required": [
    "itemType",
    "itemId"
  ]
}
```
### Example <a name="recent-item-example"></a>

```json
{
  "itemType": "device",
  "parentId": "575ec8687ae143cd83dc4a97",
  "itemId": "575ecf887ae143cd83dc4aa2"
}
```

<br/>

## Recent Item List

Schema for an array of recent items

### Schema <a name="recent-item-list-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "itemType": {
      "type": "string",
      "enum": [
        "application",
        "device",
        "flow",
        "dashboard"
      ]
    },
    "parentId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "items": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        }
      }
    }
  }
}
```
### Example <a name="recent-item-list-example"></a>

```json
{
  "itemType": "application",
  "items": [
    {
      "id": "575ec8687ae143cd83dc4a97",
      "name": "My Application"
    },
    {
      "id": "575efbcc7ae143cd83dc4aae",
      "name": "My Other Application"
    }
  ]
}
```

<br/>

## Success

Schema for reporting a successful operation

### Schema <a name="success-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "success": {
      "type": "boolean",
      "enum": [
        true
      ]
    }
  }
}
```
### Example <a name="success-example"></a>

```json
{
  "success": true
}
```

<br/>

## Time Series Data

Schema for the result of a time series query

### Schema <a name="time-series-data-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "start": {
      "type": "string",
      "format": "date-time"
    },
    "end": {
      "type": "string",
      "format": "date-time"
    },
    "resolution": {
      "type": "number"
    },
    "aggregation": {
      "type": "string",
      "enum": [
        "FIRST",
        "LAST",
        "COUNT",
        "MAX",
        "MIN",
        "MEDIAN",
        "MEAN",
        "SUM"
      ]
    },
    "devices": {
      "type": "object",
      "patternProperties": {
        "^[A-Fa-f\\d]{24}$": {
          "type": "object",
          "properties": {
            "name": {
              "type": "string",
              "minLength": 1,
              "maxLength": 255
            },
            "points": {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  "time": {
                    "type": "string",
                    "format": "date-time"
                  },
                  "data": {
                    "type": "object",
                    "patternProperties": {
                      "^[0-9a-zA-Z_-]{1,255}$": {
                        "type": [
                          "number",
                          "string",
                          "boolean"
                        ]
                      }
                    },
                    "additionalProperties": false
                  }
                },
                "additionalProperties": false,
                "required": [
                  "data",
                  "time"
                ]
              }
            }
          },
          "additionalProperties": false,
          "required": [
            "name",
            "points"
          ]
        }
      },
      "additionalProperties": false
    }
  },
  "additionalProperties": false,
  "required": [
    "start",
    "end",
    "resolution",
    "aggregation",
    "devices"
  ]
}
```
### Example <a name="time-series-data-example"></a>

```json
{
  "start": "2016-06-15T03:50:00.000Z",
  "end": "2016-06-15T04:00:00.000Z",
  "resolution": 300000,
  "aggregation": "MEAN",
  "devices": {
    "575ecf887ae143cd83dc4aa2": {
      "name": "My Device",
      "points": [
        {
          "time": "2016-06-15T03:50:00.000Z",
          "data": {
            "voltage": 10.3
          }
        },
        {
          "time": "2016-06-15T03:55:00.000Z",
          "data": {
            "voltage": 12.7
          }
        }
      ]
    },
    "575ef5c97ae143cd83dc4aac": {
      "name": "My Other Device",
      "points": [
        {
          "time": "2016-06-15T03:50:00.000Z",
          "data": {
            "voltage": 10.3
          }
        },
        {
          "time": "2016-06-15T03:55:00.000Z",
          "data": {
            "voltage": 12.7
          }
        }
      ]
    }
  }
}
```

<br/>

## Time Series Query

Schema for the body of a time series query request

### Schema <a name="time-series-query-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "start": {
      "type": "number"
    },
    "end": {
      "type": "number"
    },
    "duration": {
      "type": "number"
    },
    "resolution": {
      "type": "number"
    },
    "aggregation": {
      "type": "string",
      "enum": [
        "FIRST",
        "LAST",
        "COUNT",
        "MAX",
        "MIN",
        "MEDIAN",
        "MEAN",
        "SUM"
      ]
    },
    "attributes": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[0-9a-zA-Z_-]{1,255}$"
      }
    },
    "deviceTags": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "key": {
            "type": "string",
            "pattern": "^[0-9a-zA-Z_-]{1,255}$"
          },
          "value": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          }
        },
        "additionalProperties": false
      }
    },
    "deviceIds": {
      "type": "array",
      "items": {
        "type": "string",
        "pattern": "^[A-Fa-f\\d]{24}$"
      }
    }
  },
  "additionalProperties": false
}
```
### Example <a name="time-series-query-example"></a>

```json
{
  "end": 0,
  "duration": 600000,
  "resolution": 300000,
  "aggregation": "MEAN",
  "attributes": [
    "voltage"
  ],
  "deviceTags": {
    "key": "floor",
    "value": "8"
  }
}
```

<br/>

## User Credentials

Schema for the body of a User authentication request

### Schema <a name="user-credentials-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "email": {
      "type": "string",
      "format": "email",
      "maxLength": 1024
    },
    "password": {
      "type": "string",
      "minLength": 8,
      "maxLength": 2048
    },
    "twoFactorCode": {
      "type": "string",
      "maxLength": 2048
    }
  },
  "required": [
    "email",
    "password"
  ],
  "additionalProperties": false
}
```
### Example <a name="user-credentials-example"></a>

```json
{
  "email": "example@losant.com",
  "password": "this is the password"
}
```

<br/>

## Virtual Button Press

Schema for the body of a request to press a Workflow virtual button

### Schema <a name="virtual-button-press-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "key": {
      "type": "string"
    },
    "payload": {}
  },
  "required": [
    "key"
  ],
  "additionalProperties": false
}
```
### Example <a name="virtual-button-press-example"></a>

```json
{
  "key": "575ed18f7ae143cd83dc4aa6-SJaEw_dV",
  "payload": {
    "some": "data"
  }
}
```

<br/>

## Webhook

Schema for a single Webhook

### Schema <a name="webhook-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "webhookId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    },
    "creationDate": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "token": {
      "type": "string",
      "minLength": 1
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    }
  }
}
```
### Example <a name="webhook-example"></a>

```json
{
  "id": "575ed78e7ae143cd83dc4aab",
  "webhookId": "575ed78e7ae143cd83dc4aab",
  "applicationId": "575ec8687ae143cd83dc4a97",
  "creationDate": "2016-06-13T04:00:00.000Z",
  "lastUpdated": "2016-06-13T04:00:00.000Z",
  "name": "My Webhook",
  "token": "the_webhook_token",
  "responseCode": 200
}
```

<br/>

## Webhook Patch

Schema for the body of a Webhook modification request

### Schema <a name="webhook-patch-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "additionalProperties": false
}
```
### Example <a name="webhook-patch-example"></a>

```json
{
  "name": "My Updated Webhook",
  "responseCode": 201
}
```

<br/>

## Webhook Post

Schema for the body of a Webhook creation request

### Schema <a name="webhook-post-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 255
    },
    "responseCode": {
      "type": "integer",
      "minimum": 100,
      "maximum": 599
    },
    "verificationType": {
      "type": "string",
      "enum": [
        "facebook",
        "fitbit",
        "none"
      ]
    },
    "verificationCode": {
      "type": "string",
      "maxLength": 32767
    }
  },
  "required": [
    "name"
  ],
  "additionalProperties": false
}
```
### Example <a name="webhook-post-example"></a>

```json
{
  "name": "My New Webhook"
}
```

<br/>

## Webhooks

Schema for a collection of Webhooks

### Schema <a name="webhooks-schema"></a>

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "items": {
      "type": "array",
      "items": {
        "title": "Webhook",
        "description": "Schema for a single Webhook",
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "webhookId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "applicationId": {
            "type": "string",
            "pattern": "^[A-Fa-f\\d]{24}$"
          },
          "creationDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdated": {
            "type": "string",
            "format": "date-time"
          },
          "name": {
            "type": "string",
            "minLength": 1,
            "maxLength": 255
          },
          "token": {
            "type": "string",
            "minLength": 1
          },
          "responseCode": {
            "type": "integer",
            "minimum": 100,
            "maximum": 599
          },
          "verificationType": {
            "type": "string",
            "enum": [
              "facebook",
              "fitbit",
              "none"
            ]
          },
          "verificationCode": {
            "type": "string",
            "maxLength": 32767
          }
        }
      }
    },
    "count": {
      "type": "integer"
    },
    "totalCount": {
      "type": "integer"
    },
    "perPage": {
      "type": "integer"
    },
    "page": {
      "type": "integer"
    },
    "filter": {
      "type": "string"
    },
    "filterField": {
      "type": "string"
    },
    "sortField": {
      "type": "string"
    },
    "sortDirection": {
      "type": "string",
      "enum": [
        "asc",
        "desc"
      ]
    },
    "applicationId": {
      "type": "string",
      "pattern": "^[A-Fa-f\\d]{24}$"
    }
  }
}
```
### Example <a name="webhooks-example"></a>

```json
{
  "items": [
    {
      "id": "575ed78e7ae143cd83dc4aab",
      "webhookId": "575ed78e7ae143cd83dc4aab",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Webhook",
      "token": "the_webhook_token",
      "responseCode": 200
    }
  ],
  "count": 1,
  "totalCount": 4,
  "perPage": 1,
  "page": 0,
  "sortField": "name",
  "sortDirection": "asc",
  "applicationId": "575ec8687ae143cd83dc4a97"
}
```

<br/>
