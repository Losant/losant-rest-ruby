# Losant Ruby REST API Client

![Build Status](https://github.com/Losant/losant-rest-js/actions/workflows/test.yml/badge.svg?branch=master)  [![Gem Version](https://badge.fury.io/rb/losant_rest.svg)](https://badge.fury.io/rb/losant_rest)

The [Losant](https://www.losant.com) REST API client provides a simple way to use the comprehensive Losant API. You can authenticate either as a Losant device or with your user account, and have access to all the functionality of the Losant platform.

This client works with Ruby 2.1 and higher. It uses [HTTParty](https://github.com/jnunemaker/httparty) under the covers for the actual HTTP communication.

<br/>

## Installation

The latest stable version is available in RubyGems and can be installed using

```bash
gem install losant_rest
```

<br/>

## Example

Below is a high-level example of using the Losant Ruby REST API client to authenticate against the Losant Platform and report state for a device.

```ruby
require "platform_rest"

response = PlatformRest.auth.authenticate_device(credentials: {
  deviceId: "my-device-id",
  key: "my-app-access-key",
  secret: "my-app-access-secret"
})

PlatformRest.auth_token = response["token"]
app_id = response["applicationId"]

state = { data: { temperature: AnalogSensor.read } }
response = PlatformRest.device.send_state(deviceId: "my-device-id",
  applicationId: app_id, deviceState: state)

puts response
# { "success" => true }
```

<br/>

## API Documentation

### PlatformRest

PlatformRest is the wrapping module, but it also acts as a singleton [Client](#PlatformRestclient) instance. So if you only need a single client instance, you do not need to instantiate one yourself - the PlatformRest module will act exactly like an instance of PlatformRest::Client.

<br/>

### PlatformRest::Client

A client is a single api instance. By default, it is unauthenticated, but can
be given an access token to perform authenticated requests.

#### Initializer

```ruby
PlatformRest::Client.new(auth_token: nil, url: "https://api.losant.com")
```

The ``Client()`` initializer takes the following arguments:

* auth_token  
  The access token to be used for authentication - by default there is no access token. An access token can be acquired through any of the [Auth](docs/auth.md) methods, or can be created for a particular application through [application_api_tokens](docs/applicationApiTokens.md).

* url  
  The url of the Losant API - by default <https://api.losant.com>.

#### Client Accessors

* auth_token  
  The access token can be accessed or changed after Client creation through this accessor.

* url  
  The api base url can be accessed or changed after Client creation through this accessor.

#### Resources

Each of the following is a method on the client object, and returns a wrapper for the actions against that particular resource. See each resource documentation file for more information.

* [application](docs/application.md)  
  Contains all of the actions that can be performed against a single [Application](https://docs.losant.com/applications/overview/), which include things like getting info on an application or modifying an application.

* [applications](docs/applications.md)  
  Contains all of the actions that can be performed against the set of [Applications](https://docs.losant.com/applications/overview/) that the currently authenticated user has access to - such as listing the applications or creating a new application.

* [application_api_token](docs/applicationApiToken.md)  
  Contains all the actions that can be performed against a single [Api Token](https://docs.losant.com/applications/application-tokens/) belonging to an application - for instance, getting info on a single token or revoking a token.

* [application_api_tokens](docs/applicationApiTokens.md)  
  Contains all of the actions that can be performed against the collection of [Api Tokens](https://docs.losant.com/applications/application-tokens/) belonging to an Application - such as listing all tokens or creating a new token.

* [application_key](docs/applicationKey.md)  
  Contains all the actions that can be performed against a single [Application Key](https://docs.losant.com/applications/access-keys/) - for instance, getting info on a single key or revoking a key.

* [application_keys](docs/applicationKeys.md)  
  Contains all of the actions that can be performed against the collection of [Application Keys](https://docs.losant.com/applications/access-keys/) belonging to an Application - such as listing all keys or creating a new key.

* [auth](docs/auth.md)  
  Contains the actions used for authenticating against the api, either as a user or as a device. The result of authentication calls contain the auth_token needed for authenticated calls - see the examples for more details.

* [dashboard](docs/dashboard.md)  
  Contains all of the actions that can be performed against a single [Dashboard](https://docs.losant.com/dashboards/overview/), which include things like getting info on a dashboard or modifying a dashboard.

* [dashboards](docs/dashboards.md)  
  Contains all of the actions that can be performed against the set of [Dashboards](https://docs.losant.com/dashboards/overview/) that the currently authenticated user has access to - such as listing the dashboards or creating a new dashboard.

* [data](docs/data.md)  
  Contains the actions for querying against historical Device data across an Application.

* [data_table](docs/dataTable.md)  
  Contains all the actions that can be performed against a single [Data Table](https://docs.losant.com/data-tables/overview/) - for instance, getting info on a single data table or modifying the columns of a data table.

* [data_tables](docs/dataTables.md)  
  Contains all of the actions that can be performed against the collection of [Data Tables](https://docs.losant.com/data-tables/overview/) belonging to an Application - such as listing all data tables or creating a new data table.

* [data_table_row](docs/dataTableRow.md)  
  Contains all the actions that can be performed against a single row inside of a [Data Table](https://docs.losant.com/data-tables/overview/) - for instance, getting the contents of a row, or modifying a row.

* [data_table_rows](docs/dataTableRows.md)  
  Contains all of the actions that can be performed against the collection of rows that make up a [Data Table](https://docs.losant.com/data-tables/overview/) - such as querying for rows in that table, or adding a new row to the table.

* [device](docs/device.md)  
  Contains all the actions that can be performed against a single [Device](https://docs.losant.com/devices/overview/) - for instance, getting info on a single device or reporting the current state of a device.

* [devices](docs/devices.md)  
  Contains all of the actions that can be performed against the collection of [Devices](https://docs.losant.com/devices/overview/) belonging to an Application - such as listing all devices or sending a command to a set of devices.

* [device_recipe](docs/deviceRecipe.md)  
  Contains all the actions that can be performed against a single [Device Recipe](https://docs.losant.com/devices/device-recipes/), which include things like removing a device recipe or creating a device from a device recipe.

* [device_recipes](docs/deviceRecipes.md)  
  Contains all the actions that can be performed against the collection of [Device Recipes](https://docs.losant.com/devices/device-recipes/) belonging to an Application - such as listing recipes or creating a new recipe.

* [edge_deployments](docs/edgeDeployments.md)  
  Contains all the actions that can be performed against the collection of [Edge Deployments](https://docs.losant.com/edge-compute/edge-deployments/) belonging to an Application - such as listing deployments or creating a new deployment.

* [event](docs/event.md)  
  Contains all the actions that can be performed against a single [Event](https://docs.losant.com/events/overview/), such as commenting on or changing the state of an event.

* [events](docs/events.md)  
  Contains all the actions that can be performed against the collection of [Events](https://docs.losant.com/events/overview/) belonging to an Application - such as listing open events or creating a new event.

* [experience](docs/experience.md)  
  Contains all the actions that can be performed against an application [Experience](https://docs.losant.com/experiences/), such as bootstrapping or clearing resources.

* [experience_domain](docs/experienceDomain.md)  
  Contains all the actions that can be performed against a single [Experience Domain](https://docs.losant.com/experiences/domains/), such as updating SSL certificate information.

* [experience_domains](docs/experienceDomains.md)  
  Contains all the actions that can be performed against the collection of [Experience Domains](https://docs.losant.com/experiences/domains/) belonging to an Application - such as listing domains or creating a new domain.

* [experience_endpoint](docs/experienceEndpoint.md)  
  Contains all the actions that can be performed against a single [Experience Endpoint](https://docs.losant.com/experiences/endpoints/), such as updating route information.

* [experience_endpoints](docs/experienceEndpoints.md)  
  Contains all the actions that can be performed against the collection of [Experience Endpoints](https://docs.losant.com/experiences/endpoints/) belonging to an Application - such as listing endpoints or creating a new endpoint.

* [experience_group](docs/experienceGroup.md)  
  Contains all the actions that can be performed against a single [Experience Group](https://docs.losant.com/experiences/groups/), such as updating member information.

* [experience_groups](docs/experienceGroups.md)  
  Contains all the actions that can be performed against the collection of [Experience Groups](https://docs.losant.com/experiences/groups/) belonging to an Application - such as listing groups or creating a new group.

* [experience_slug](docs/experienceSlug.md)  
  Contains all the actions that can be performed against a single [Experience Slug](https://docs.losant.com/experiences/domains/), such as changing the associated version.

* [experience_slugs](docs/experienceSlugs.md)  
  Contains all the actions that can be performed against the collection of [Experience Slugs](https://docs.losant.com/experiences/domains/) belonging to an Application - such as listing slugs or creating a new slug.

* [experience_user](docs/experienceUser.md)  
  Contains all the actions that can be performed against a single [Experience User](https://docs.losant.com/experiences/users/), such as changing their email or password.

* [experience_users](docs/experienceUsers.md)  
  Contains all the actions that can be performed against the collection of [Experience Users](https://docs.losant.com/experiences/users/) belonging to an Application - such as listing users or creating a new user.

* [experience_version](docs/experienceVersion.md)  
  Contains all the actions that can be performed against a single [Experience Version](https://docs.losant.com/experiences/), such as modifying the description.

* [experience_versions](docs/experienceVersions.md)  
  Contains all the actions that can be performed against the collection of [Experience Versions](https://docs.losant.com/experiences/) belonging to an Application - such as listing versions or creating a new versions.

* [experience_view](docs/experienceView.md)  
  Contains all the actions that can be performed against a single [Experience View](https://docs.losant.com/experiences/views/), such as modifying the body template.

* [experience_views](docs/experienceViews.md)  
  Contains all the actions that can be performed against the collection of [Experience Views](https://docs.losant.com/experiences/views/) belonging to an Application - such as listing views or creating a new view.

* [file](docs/file.md)  
  Contains all the actions that can be performed against a single [File](https://docs.losant.com/applications/files/), such as moving, renaming, or deleting.

* [files](docs/files.md)  
  Contains all the actions that can be performed against the collection of [Files](https://docs.losant.com/applications/files/) belonging to an Application - such as listing files or uploading a new file.

* [flow](docs/flow.md)  
  Contains all the actions that can be performed against a single [Workflow](https://docs.losant.com/workflows/overview/), such as enabling or disabling a workflow, or triggering a virtual button in the workflow.

* [flows](docs/flows.md)  
  Contains all the actions that can be performed against the collection of [Workflows](https://docs.losant.com/workflows/overview/) belonging to an Application - such as listing the workflows or creating a new workflow.

* [flow_version](docs/flowVersion.md)  
  Contains all the actions that can be performed against a single [Workflow Version](https://docs.losant.com/workflows/versioning/), such as enabling or disabling a workflow version, or updating the version notes.

* [flow_versions](docs/flowVersions.md)  
  Contains all the actions that can be performed against the collection of [Workflow Versions](https://docs.losant.com/workflows/versioning/) belonging to a Workflow - such as listing the versions or creating a new version.

* [me](docs/me.md)  
  Contains the actions for operating against the currently authenticated [User](https://docs.losant.com/user-accounts/overview/) such as changing the password or linking against external services.

* [integration](docs/integration.md)  
  Contains all the actions that can be performed against a single [Integration](https://docs.losant.com/applications/integrations/), which include things like removing an integration or updating integration configuration.

* [integrations](docs/integrations.md)  
  Contains all the actions that can be performed against the collection of [Integrations](https://docs.losant.com/applications/integrations/) belonging to an Application - such as listing integrations or creating a new integration.

* [org](docs/org.md)  
  Contains all the actions that can be performed against a single [Organization](https://docs.losant.com/organizations/overview/), things like inviting a user to the organization, or modifying the organization.

* [orgs](docs/orgs.md)  
  Contains all of the actions that can be performed against the set of [Organizations](https://docs.losant.com/organizations/overview/) that the currently authenticated user has access to - such as listing the organizations or creating a new organization.

* [webhook](docs/webhook.md)  
  Contains all the actions that can be performed against a single [Webhook](https://docs.losant.com/applications/webhooks/), for instance modifying the verification settings or removing the webhook.

* [webhooks](docs/webhooks.md)  
  Contains all the actions that can be performed against the collection of [Webhooks](https://docs.losant.com/applications/webhooks/) belonging to an Application - such as listing the webhooks or creating a new webhook.

<br/>

### PlatformRest::ResponseError

When the Losant API returns a unsuccessful response, an instance of ResponseError is thrown.

#### ResponseError Accessors

* code  
  The status code returned from the Losant API.

* type  
  The type of error that occurred, such as "Validation" or "Authorization".

* message  
  A more detailed message about the particulars of the error.

<br/>

*****

Copyright (c) 2024 Losant IoT, Inc

<https://www.losant.com>
