module LosantRest

  # Class containing all the actions for the Data Resource
  class Data

    def initialize(client)
      @client = client
    end

    # Returns the data for the given query
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} query - The query parameters (https://api.losant.com/#/definitions/timeSeriesQuery)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Data for requested time range (https://api.losant.com/#/definitions/timeSeriesData)
    #
    # Errors:
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def time_series_query(params = {})
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

      param_key = if params.has_key?("query")      
        "query"      
      elsif params.has_key?(:"query")      
        :"query"      
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

      path = "/applications/%{applicationId}/data/time-series-query"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns the last known data for the given attribute
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} query - The query parameters (https://api.losant.com/#/definitions/lastValueQuery)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Last known data for the requested attribute (https://api.losant.com/#/definitions/lastValueData)
    #
    # Errors:
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def last_value_query(params = {})
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

      param_key = if params.has_key?("query")      
        "query"      
      elsif params.has_key?(:"query")      
        :"query"      
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

      path = "/applications/%{applicationId}/data/last-value-query"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
