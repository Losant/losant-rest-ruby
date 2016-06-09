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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("device is required") unless params.has_key?(:device)

      body = params[:device] if params.has_key?(:device)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

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
    # *  {string} limit - Max state entries to return (ordered by time descending)
    # *  {string} since - Look for state entries since this time (ms since epoch)
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/state"

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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("deviceState is required") unless params.has_key?(:deviceState)

      body = params[:deviceState] if params.has_key?(:deviceState)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/state"

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
    # *  {string} limit - Max command entries to return (ordered by time descending)
    # *  {string} since - Look for command entries since this time (ms since epoch)
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/command"

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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("deviceCommand is required") unless params.has_key?(:deviceCommand)

      body = params[:deviceCommand] if params.has_key?(:deviceCommand)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/command"

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
    # *  {string} limit - Max log entries to return (ordered by time descending)
    # *  {string} since - Look for log entries since this time (ms since epoch)
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/logs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
