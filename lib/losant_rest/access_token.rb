module LosantRest

  # Class containing all the actions for the Access Token Resource
  class AccessToken

    def initialize(client)
      @client = client
    end

    # Retrieves information on an accessToken
    #
    # Parameters:
    # *  {string} accessTokenId - ID associated with the accessToken
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Device information (https://api.losant.com/#/definitions/accessToken)
    #
    # Errors:
    # *  404 - Error if accessToken was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("accessTokenId")      
        "accessTokenId"      
      elsif params.has_key?(:"accessTokenId")      
        :"accessTokenId"      
      else      
        nil      
      end      
      path_params[:"accessTokenId"] = params[param_key] if param_key

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

      path = "/access-tokens/%{accessTokenId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a accessToken
    #
    # Parameters:
    # *  {string} accessTokenId - ID associated with the accessToken
    # *  {hash} accessToken - Object containing new properties of the accessToken (https://api.losant.com/#/definitions/accessTokenPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated accessToken information (https://api.losant.com/#/definitions/accessToken)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if accessToken was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("accessTokenId")      
        "accessTokenId"      
      elsif params.has_key?(:"accessTokenId")      
        :"accessTokenId"      
      else      
        nil      
      end      
      path_params[:"accessTokenId"] = params[param_key] if param_key

      param_key = if params.has_key?("accessToken")      
        "accessToken"      
      elsif params.has_key?(:"accessToken")      
        :"accessToken"      
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

      path = "/access-tokens/%{accessTokenId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes a accessToken
    #
    # Parameters:
    # *  {string} accessTokenId - ID associated with the accessToken
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If accessToken was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if accessToken was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("accessTokenId")      
        "accessTokenId"      
      elsif params.has_key?(:"accessTokenId")      
        :"accessTokenId"      
      else      
        nil      
      end      
      path_params[:"accessTokenId"] = params[param_key] if param_key

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

      path = "/access-tokens/%{accessTokenId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
