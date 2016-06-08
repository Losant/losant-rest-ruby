module LosantRest

  # Class containing all the actions for the Org Resource
  class Org

    def initialize(client)
      @client = client
    end

    # Retrieves information on an organization
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Organization information (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about an organization
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {hash} organization - Object containing new organization properties (https://api.losant.com/#/definitions/orgPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated organization information (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes an organization
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If organization was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  404 - Error if organization was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Gets the current pending invites
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Invitation information (https://api.losant.com/#/definitions/orgInvites)
    #
    # Errors:
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def pending_invites(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}/invites"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Invites a person to an organization
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {hash} invite - Object containing new invite info (https://api.losant.com/#/definitions/orgInvitePost)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Invitation information (https://api.losant.com/#/definitions/orgInvites)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def invite_member(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

      param_key = if params.has_key?("invite")      
        "invite"      
      elsif params.has_key?(:"invite")      
        :"invite"      
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

      path = "/orgs/%{orgId}/invites"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Revokes an existing invite
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} inviteId - Id of invite to revoke
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Invitation information (https://api.losant.com/#/definitions/orgInvites)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def revoke_invite(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

      param_key = if params.has_key?("inviteId")      
        "inviteId"      
      elsif params.has_key?(:"inviteId")      
        :"inviteId"      
      else      
        nil      
      end      
      query_params[:"inviteId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}/invites"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Modifies a current org member&#x27;s role
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {hash} member - Object containing new member pair (https://api.losant.com/#/definitions/orgMemberPatch)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated organization information (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def modify_member(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

      param_key = if params.has_key?("member")      
        "member"      
      elsif params.has_key?(:"member")      
        :"member"      
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

      path = "/orgs/%{orgId}/member"
      path = path % path_params unless path_params.empty?

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Modifies a current org member&#x27;s role
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} userId - Id of user to remove
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated organization information (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization not found (https://api.losant.com/#/definitions/error)
    def remove_member(params = {})
      query_params = { _actions: false, _links: true, _embedded: true }
      path_params = {}
      headers = {}
      body = nil

      param_key = if params.has_key?("orgId")      
        "orgId"      
      elsif params.has_key?(:"orgId")      
        :"orgId"      
      else      
        nil      
      end      
      path_params[:"orgId"] = params[param_key] if param_key

      param_key = if params.has_key?("userId")      
        "userId"      
      elsif params.has_key?(:"userId")      
        :"userId"      
      else      
        nil      
      end      
      query_params[:"userId"] = params[param_key] if param_key

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

      path = "/orgs/%{orgId}/member"
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
