module LosantRest

  # Class containing all the actions for the Access Token Resource
  class AccessToken

    def initialize(client)
      @client = client
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("accessTokenId is required") unless params.has_key?(:accessTokenId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/access-tokens/#{params[:accessTokenId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("accessTokenId is required") unless params.has_key?(:accessTokenId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/access-tokens/#{params[:accessTokenId]}"

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
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("accessTokenId is required") unless params.has_key?(:accessTokenId)
      raise ArgumentError.new("accessToken is required") unless params.has_key?(:accessToken)

      body = params[:accessToken] if params.has_key?(:accessToken)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/access-tokens/#{params[:accessTokenId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
