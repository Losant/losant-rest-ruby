module LosantRest

  # Class containing all the actions for the Orgs Resource
  class Orgs

    def initialize(client)
      @client = client
    end

    # Returns the organizations associated with the current user
    #
    # Parameters:
    # *  {string} sortField
    # *  {string} sortDirection
    # *  {string} page
    # *  {string} perPage
    # *  {string} filterField
    # *  {string} filter
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of organizations (https://api.losant.com/#/definitions/orgs)
    #
    # Errors:
    def get(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

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

      path = "/orgs"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new organization
    #
    # Parameters:
    # *  {hash} organization - New organization information (https://api.losant.com/#/definitions/orgPost)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully created organization (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def post(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("organization")      
        "organization"      
      elsif params.has_key?(:"organization")      
        :"organization"      
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

      path = "/orgs"
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
