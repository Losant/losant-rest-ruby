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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/flows/%{flowId}"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

      param_key = if params.has_key?("flow")      
        "flow"      
      elsif params.has_key?(:"flow")      
        :"flow"      
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

      path = "/applications/%{applicationId}/flows/%{flowId}"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/flows/%{flowId}"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/flows/%{flowId}/debug"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/flows/%{flowId}/logs"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

      param_key = if params.has_key?("button")      
        "button"      
      elsif params.has_key?(:"button")      
        :"button"      
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

      path = "/applications/%{applicationId}/flows/%{flowId}/virtualButton"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/flows/%{flowId}/storage"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("flowId")      
        "flowId"      
      elsif params.has_key?(:"flowId")      
        :"flowId"      
      else      
        nil      
      end      
      path_params[:"flowId"] = params[param_key] if param_key

      param_key = if params.has_key?("entry")      
        "entry"      
      elsif params.has_key?(:"entry")      
        :"entry"      
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

      path = "/applications/%{applicationId}/flows/%{flowId}/storage"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
