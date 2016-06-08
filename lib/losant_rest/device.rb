module LosantRest

  # Class containing all the actions for the Device Resource
  class Device

    def initialize(client)
      @client = client
    end

    # Retrieves information on an device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Device information (https://api.losant.com/#/definitions/device)
    #
    # Errors:
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} device - Object containing new properties of the device (https://api.losant.com/#/definitions/devicePatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated device information (https://api.losant.com/#/definitions/device)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("device")      
        "device"      
      elsif params.has_key?(:"device")      
        :"device"      
      else      
        nil      
      end      
      body = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes a device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If device was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the last known state(s) of the device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit
    # *  {string} since
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent device states (https://api.losant.com/#/definitions/deviceStates)
    #
    # Errors:
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_state(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("limit")      
        "limit"      
      elsif params.has_key?(:"limit")      
        :"limit"      
      else      
        nil      
      end      
      query_params[:"limit"] = params[param_key] if param_key

      param_key = if params.has_key?("since")      
        "since"      
      elsif params.has_key?(:"since")      
        :"since"      
      else      
        nil      
      end      
      query_params[:"since"] = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}/state"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Send the current state of the device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} deviceState - Object containing the current state of the device (https://api.losant.com/#/definitions/deviceState)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If state was successfully received (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def send_state(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceState")      
        "deviceState"      
      elsif params.has_key?(:"deviceState")      
        :"deviceState"      
      else      
        nil      
      end      
      body = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}/state"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the last known commands(s) sent to the device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit
    # *  {string} since
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent device commands (https://api.losant.com/#/definitions/deviceCommands)
    #
    # Errors:
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_command(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("limit")      
        "limit"      
      elsif params.has_key?(:"limit")      
        :"limit"      
      else      
        nil      
      end      
      query_params[:"limit"] = params[param_key] if param_key

      param_key = if params.has_key?("since")      
        "since"      
      elsif params.has_key?(:"since")      
        :"since"      
      else      
        nil      
      end      
      query_params[:"since"] = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}/command"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Send a command to a device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} deviceCommand - Command to send to the device (https://api.losant.com/#/definitions/deviceCommand)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If command was successfully sent (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def send_command(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceCommand")      
        "deviceCommand"      
      elsif params.has_key?(:"deviceCommand")      
        :"deviceCommand"      
      else      
        nil      
      end      
      body = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}/command"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the recent log entries about the device
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit
    # *  {string} since
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent log entries
    #
    # Errors:
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_log_entries(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("applicationId")      
        "applicationId"      
      elsif params.has_key?(:"applicationId")      
        :"applicationId"      
      else      
        nil      
      end      
      path_params[:"applicationId"] = params[param_key] if param_key

      param_key = if params.has_key?("deviceId")      
        "deviceId"      
      elsif params.has_key?(:"deviceId")      
        :"deviceId"      
      else      
        nil      
      end      
      path_params[:"deviceId"] = params[param_key] if param_key

      param_key = if params.has_key?("limit")      
        "limit"      
      elsif params.has_key?(:"limit")      
        :"limit"      
      else      
        nil      
      end      
      query_params[:"limit"] = params[param_key] if param_key

      param_key = if params.has_key?("since")      
        "since"      
      elsif params.has_key?(:"since")      
        :"since"      
      else      
        nil      
      end      
      query_params[:"since"] = params[param_key] if param_key

      param_key = if params.has_key?("_actions")      
        "_actions"      
      elsif params.has_key?(:"_actions")      
        :"_actions"      
      else      
        nil      
      end      
      query_params[:"_actions"] = params[param_key] if param_key

      param_key = if params.has_key?("_links")      
        "_links"      
      elsif params.has_key?(:"_links")      
        :"_links"      
      else      
        nil      
      end      
      query_params[:"_links"] = params[param_key] if param_key

      param_key = if params.has_key?("_embedded")      
        "_embedded"      
      elsif params.has_key?(:"_embedded")      
        :"_embedded"      
      else      
        nil      
      end      
      query_params[:"_embedded"] = params[param_key] if param_key

      path = "/applications/%{applicationId}/devices/%{deviceId}/logs"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
