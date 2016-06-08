module LosantRest

  # Class containing all the actions for the Flow Resource
  class Flow

    def initialize(client)
      @client = client
    end

    # Retrieves information on an flow
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Flow information (https://api.losant.com/#/definitions/flow)
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a flow
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {hash} flow - Object containing new properties of the flow (https://api.losant.com/#/definitions/flowPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated flow information (https://api.losant.com/#/definitions/flow)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow is not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flow is required") unless params.has_key?(:flow)

      body = params[:flow] if params.has_key?(:flow)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes a flow
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If flow was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Streams real time flow debug events using SSE
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Stream of flow debug events
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def debug(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/debug"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the recent log entries about the flows
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/logs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Presses the specified virtual button on the flow
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {hash} button - Object containing button key and payload (https://api.losant.com/#/definitions/virtualButtonPress)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Virtual button was pressed (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def press_virtual_button(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("button is required") unless params.has_key?(:button)

      body = params[:button] if params.has_key?(:button)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/virtualButton"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Gets the current values in persistent storage
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - The stored values
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def get_storage_entries(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/storage"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Sets a storage value
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {hash} entry - Object containing storage entry (https://api.losant.com/#/definitions/flowStorageEntry)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Value was successfully stored (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if flow was not found (https://api.losant.com/#/definitions/error)
    def set_storage_entry(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("entry is required") unless params.has_key?(:entry)

      body = params[:entry] if params.has_key?(:entry)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/storage"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
