module LosantRest

  # Class containing all the actions for the Events Resource
  class Events

    def initialize(client)
      @client = client
    end

    # Returns the events for an application
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} sortField
    # *  {string} sortDirection
    # *  {string} page
    # *  {string} perPage
    # *  {string} filterField
    # *  {string} filter
    # *  {string} state
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of events (https://api.losant.com/#/definitions/events)
    #
    # Errors:
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
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

      param_key = if params.has_key?("sortField")      
        "sortField"      
      elsif params.has_key?(:"sortField")      
        :"sortField"      
      else      
        nil      
      end      
      query_params[:"sortField"] = params[param_key] if param_key

      param_key = if params.has_key?("sortDirection")      
        "sortDirection"      
      elsif params.has_key?(:"sortDirection")      
        :"sortDirection"      
      else      
        nil      
      end      
      query_params[:"sortDirection"] = params[param_key] if param_key

      param_key = if params.has_key?("page")      
        "page"      
      elsif params.has_key?(:"page")      
        :"page"      
      else      
        nil      
      end      
      query_params[:"page"] = params[param_key] if param_key

      param_key = if params.has_key?("perPage")      
        "perPage"      
      elsif params.has_key?(:"perPage")      
        :"perPage"      
      else      
        nil      
      end      
      query_params[:"perPage"] = params[param_key] if param_key

      param_key = if params.has_key?("filterField")      
        "filterField"      
      elsif params.has_key?(:"filterField")      
        :"filterField"      
      else      
        nil      
      end      
      query_params[:"filterField"] = params[param_key] if param_key

      param_key = if params.has_key?("filter")      
        "filter"      
      elsif params.has_key?(:"filter")      
        :"filter"      
      else      
        nil      
      end      
      query_params[:"filter"] = params[param_key] if param_key

      param_key = if params.has_key?("state")      
        "state"      
      elsif params.has_key?(:"state")      
        :"state"      
      else      
        nil      
      end      
      query_params[:"state"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/events"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new event for an application
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} event - New event information (https://api.losant.com/#/definitions/eventPost)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully created event (https://api.losant.com/#/definitions/event)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    # *  429 - Error if event creation rate limit exceeded (https://api.losant.com/#/definitions/error)
    def post(params = {})
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

      param_key = if params.has_key?("event")      
        "event"      
      elsif params.has_key?(:"event")      
        :"event"      
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

      path = "/applications/%{applicationId}/events"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information for matching events by subject and/or current state
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} filterField
    # *  {string} filter
    # *  {string} state
    # *  {hash} updates - Object containing updated information for the events (https://api.losant.com/#/definitions/eventPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If updates were successfully applied (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application is not found (https://api.losant.com/#/definitions/error)
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

      param_key = if params.has_key?("filterField")      
        "filterField"      
      elsif params.has_key?(:"filterField")      
        :"filterField"      
      else      
        nil      
      end      
      query_params[:"filterField"] = params[param_key] if param_key

      param_key = if params.has_key?("filter")      
        "filter"      
      elsif params.has_key?(:"filter")      
        :"filter"      
      else      
        nil      
      end      
      query_params[:"filter"] = params[param_key] if param_key

      param_key = if params.has_key?("state")      
        "state"      
      elsif params.has_key?(:"state")      
        :"state"      
      else      
        nil      
      end      
      query_params[:"state"] = params[param_key] if param_key

      param_key = if params.has_key?("updates")      
        "updates"      
      elsif params.has_key?(:"updates")      
        :"updates"      
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

      path = "/applications/%{applicationId}/events"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns the first new event ordered by severity and then creation
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} filter
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - The event, plus count of currently new events
    #
    # Errors:
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def most_recent_by_severity(params = {})
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

      param_key = if params.has_key?("filter")      
        "filter"      
      elsif params.has_key?(:"filter")      
        :"filter"      
      else      
        nil      
      end      
      query_params[:"filter"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/events/mostRecentBySeverity"
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
