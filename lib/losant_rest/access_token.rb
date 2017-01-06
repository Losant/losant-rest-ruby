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

  # Class containing all the actions for the Access Token Resource
  class AccessToken

    def initialize(client)
      @client = client
    end

    # Deletes an accessToken
    #
    # Parameters:
    # *  {string} accessTokenId - ID associated with the accessToken
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If accessToken was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if accessToken was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("accessTokenId is required") unless params.has_key?(:accessTokenId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
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
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Access token information (https://api.losant.com/#/definitions/accessToken)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if accessToken was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("accessTokenId is required") unless params.has_key?(:accessTokenId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
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

    # Updates information about an accessToken
    #
    # Parameters:
    # *  {string} accessTokenId - ID associated with the accessToken
    # *  {hash} accessToken - Object containing new properties of the accessToken (https://api.losant.com/#/definitions/accessTokenPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
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
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
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
