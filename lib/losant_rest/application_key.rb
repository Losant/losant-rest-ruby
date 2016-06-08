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

      param_key = if params.has_key?("applicationKeyId")      
        "applicationKeyId"      
      elsif params.has_key?(:"applicationKeyId")      
        :"applicationKeyId"      
      else      
        nil      
      end      
      path_params[:"applicationKeyId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/keys/%{applicationKeyId}"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("applicationKeyId")      
        "applicationKeyId"      
      elsif params.has_key?(:"applicationKeyId")      
        :"applicationKeyId"      
      else      
        nil      
      end      
      path_params[:"applicationKeyId"] = params[param_key] if param_key

      param_key = if params.has_key?("applicationKey")      
        "applicationKey"      
      elsif params.has_key?(:"applicationKey")      
        :"applicationKey"      
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

      path = "/applications/%{applicationId}/keys/%{applicationKeyId}"
      path = path % path_params unless path_params.empty?

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

      param_key = if params.has_key?("applicationKeyId")      
        "applicationKeyId"      
      elsif params.has_key?(:"applicationKeyId")      
        :"applicationKeyId"      
      else      
        nil      
      end      
      path_params[:"applicationKeyId"] = params[param_key] if param_key

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

      path = "/applications/%{applicationId}/keys/%{applicationKeyId}"
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
