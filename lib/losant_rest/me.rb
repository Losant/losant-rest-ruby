# The MIT License (MIT)
#
# Copyright (c) 2017 Losant IoT, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module LosantRest

  # Class containing all the actions for the Me Resource
  class Me

    def initialize(client)
      @client = client
    end

    # Adds an item to a recent item list
    #
    # Parameters:
    # *  {hash} data - Object containing recent item info (https://api.losant.com/#/definitions/recentItem)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated recent item list (https://api.losant.com/#/definitions/recentItemList)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def add_recent_item(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("data is required") unless params.has_key?(:data)

      body = params[:data] if params.has_key?(:data)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/recentItems"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes the current user
    #
    # Parameters:
    # *  {hash} credentials - User authentication credentials (https://api.losant.com/#/definitions/userCredentials)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If the user was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("credentials is required") unless params.has_key?(:credentials)

      body = params[:credentials] if params.has_key?(:credentials)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/delete"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Disables two factor auth for the current user
    #
    # Parameters:
    # *  {hash} data - Object containing two factor auth properties (https://api.losant.com/#/definitions/disableTwoFactorAuth)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def disable_two_factor_auth(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("data is required") unless params.has_key?(:data)

      body = params[:data] if params.has_key?(:data)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/disableTwoFactorAuth"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Disconnects the user from Github
    #
    # Parameters:
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def disconnect_github(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil


      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/disconnectGithub"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Disconnects the user from Twitter
    #
    # Parameters:
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def disconnect_twitter(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil


      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/disconnectTwitter"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Enables two factor auth for the current user
    #
    # Parameters:
    # *  {hash} data - Object containing two factor auth properties (https://api.losant.com/#/definitions/enableTwoFactorAuth)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def enable_two_factor_auth(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("data is required") unless params.has_key?(:data)

      body = params[:data] if params.has_key?(:data)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/enableTwoFactorAuth"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Gets a recent item list
    #
    # Parameters:
    # *  {string} parentId - Parent id of the recent list
    # *  {undefined} itemType - Item type to get the recent list of. Accepted values are: application, device, flow, dashboard, organization
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent item list (https://api.losant.com/#/definitions/recentItemList)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def fetch_recent_items(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("itemType is required") unless params.has_key?(:itemType)

      query_params[:parentId] = params[:parentId] if params.has_key?(:parentId)
      query_params[:itemType] = params[:itemType] if params.has_key?(:itemType)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/recentItems"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on the current user
    #
    # Parameters:
    # *  {undefined} includeRecent - Should the user include recent app/dashboard info
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Current user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil


      query_params[:includeRecent] = params[:includeRecent] if params.has_key?(:includeRecent)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about the current user
    #
    # Parameters:
    # *  {hash} user - Object containing new user properties (https://api.losant.com/#/definitions/mePatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated user information (https://api.losant.com/#/definitions/me)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("user is required") unless params.has_key?(:user)

      body = params[:user] if params.has_key?(:user)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts for the time range specified for all applications the current user owns
    #
    # Parameters:
    # *  {string} start - Start of range for payload count query (ms since epoch)
    # *  {string} end - End of range for payload count query (ms since epoch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Payload counts, by type and source (https://api.losant.com/#/definitions/payloadCounts)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def payload_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil


      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/payloadCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Moves resources to a new owner
    #
    # Parameters:
    # *  {hash} transfer - Object containing properties of the transfer (https://api.losant.com/#/definitions/resourceTransfer)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If resource transfer was successful (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def transfer_resources(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("transfer is required") unless params.has_key?(:transfer)

      body = params[:transfer] if params.has_key?(:transfer)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/transferResources"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Sends an email verification to the user
    #
    # Parameters:
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If email verification was successfully sent (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def verify_email(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil


      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/me/verify-email"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
