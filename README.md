# Losant Ruby REST API Client

The [Losant](https://www.losant.com>) REST API client provides a simple way to
use the comprehensive Losant API.  You can authenticate either as a Losant
device or with your user user account, and have access to all the functionality
of the Losant platform.

## Installation

The latest stable version is available in the RubyGems
and can be installed using

```bash
gem install losant_rest
```

## Example

Below is a high-level example of using the Losant Ruby REST API client to
authenticate against the Losant Platform and report state for a device.

```ruby
    require "losant_rest"

    client = LosantRest::Client.new()
    creds = {
      deviceId: "my-device-id",
      key: "my-app-access-key",
      secret: "my-app-access-secret" }
    response = client.auth.authenticate_device(credentials: creds)

    client.access_token = response["token"]
    app_id = response["applicationId"]

    state = { temperature: Analog.read() }
    response = client.device.send_state(deviceId: "my-device-id",
        applicationId: app_id, deviceState: state)

    puts response
```

## API Documentation

### Client

A client is a single api instance.  By default, it is unauthenticated, but can
be given an access token to perform authenticated requests.

#### Constructor

```ruby
  Client.new(auth_token: nil, url: "https://api.losant.com")
```

The ``Client()`` constructor takes the following arguments:

*   auth_token  
The access token to be used for authentication - by default there is no
access token.  An access token can be acquired through either of the
[Auth](docs/auth.md) methods.

*   url  
The url of the Losant API - by default <https://api.losant.com>.

#### Accessors

*   auth_token  
The auth token can be accessed or changed after Client creation
through this accessor.

*   url  
The api base url can be accessed or changed after Client creation
through this accessor.

#### Resources

*   [application_key](docs/applicationKey.md)  
Resource wrapper for actions that are preformed on a single Application Key.

*   [application_keys](docs/applicationKeys.md)  
Resource wrapper for actions that are performed on Application Key collections.

*   [application](docs/application.md)  
Resource wrapper for actions that are preformed on a single Application.

*   [applications](docs/applications.md)  
Resource wrapper for actions that are performed on Application collections.

*   [auth](docs/auth.md)  
Resource wrapper for the actions to authenticate as a User or as a Device.

*   [dashboard](docs/dashboard.md)  
Resource wrapper for actions that are preformed on a single Dashboard.

*   [dashboards](docs/dashboards.md)  
Resource wrapper for actions that are performed on Dashboard collections.

*   [data](docs/data.md)  
Resource wrapper for querying historical data across an Application.

*   [device](docs/device.md)  
Resource wrapper for actions that are preformed on a single Device.

*   [devices](docs/devices.md)  
Resource wrapper for actions that are performed on Device collections.

*   [device_recipe](docs/deviceRecipe.md)  
Resource wrapper for actions that are preformed on a single Device Recipe.

*   [device_recipes](docs/deviceRecipes.md)  
Resource wrapper for actions that are performed on Device Recipe collections.

*   [event](docs/event.md)  
Resource wrapper for actions that are preformed on a Event collections.

*   [events](docs/events.md)  
Resource wrapper for actions that are preformed on a Event collections.

*   [flow](docs/flow.md)  
Resource wrapper for actions that are preformed on a single Workflow.

*   [flows](docs/flows.md)  
Resource wrapper for actions that are performed on Workflow collections.

*   [me](docs/me.md)  
Resource wrapper for actions are performed on the currently authenticated user.

*   [org](docs/org.md)  
Resource wrapper for actions that are preformed on a single Organization.

*   [orgs](docs/orgs.md)  
Resource wrapper for actions that are performed on Organization collections.

*   [webhook](docs/webhook.md)  
Resource wrapper for actions that are preformed on a single Webhook.

*   [webhooks](docs/webhooks.md)  
Resource wrapper for actions that are performed on Webhook collections.

Copyright (c) 2016 Losant IoT, Inc

<https://www.losant.com>
