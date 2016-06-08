module LosantRest

  # Class containing all the actions for the Application Key Resource
  class ApplicationKey

    def initialize(client)
      @client = client
    end

    # Retrieves information on an applicationKey
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} applicationKeyId - ID associated with the applicationKey
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - applicationKey information (https://api.losant.com/#/definitions/applicationKey)
    #
    # Errors:
    # *  404 - Error if applicationKey was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("applicationKeyId is required") unless params.has_key?(:applicationKeyId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/keys/#{params[:applicationKeyId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about an applicationKey
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} applicationKeyId - ID associated with the applicationKey
    # *  {hash} applicationKey - Object containing new properties of the applicationKey (https://api.losant.com/#/definitions/applicationKeyPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated applicationKey information (https://api.losant.com/#/definitions/applicationKey)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if applicationKey was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("applicationKeyId is required") unless params.has_key?(:applicationKeyId)
      raise ArgumentError.new("applicationKey is required") unless params.has_key?(:applicationKey)

      body = params[:applicationKey] if params.has_key?(:applicationKey)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/keys/#{params[:applicationKeyId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes an applicationKey
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} applicationKeyId - ID associated with the applicationKey
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If applicationKey was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if applicationKey was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("applicationKeyId is required") unless params.has_key?(:applicationKeyId)

      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/keys/#{params[:applicationKeyId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
