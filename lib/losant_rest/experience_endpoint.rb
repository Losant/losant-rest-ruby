# The MIT License (MIT)
#
# Copyright (c) 2022 Losant IoT, Inc.
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

require "json"

module LosantRest

  # Class containing all the actions for the Experience Endpoint Resource
  class ExperienceEndpoint

    def initialize(client)
      @client = client
    end

    # Deletes an experience endpoint
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, experienceEndpoint.*, or experienceEndpoint.delete.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} experienceEndpointId - ID associated with the experience endpoint
    # *  {string} includeWorkflows - If the workflows that utilize this experience endpoint should also be deleted.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If experience endpoint was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if experience endpoint was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("experienceEndpointId is required") unless params.has_key?(:experienceEndpointId)

      query_params[:includeWorkflows] = params[:includeWorkflows] if params.has_key?(:includeWorkflows)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints/#{params[:experienceEndpointId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on an experience endpoint
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoint.*, or experienceEndpoint.get.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} experienceEndpointId - ID associated with the experience endpoint
    # *  {string} version - Version of this experience endpoint to return
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Experience endpoint information (https://api.losant.com/#/definitions/experienceEndpoint)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if experience endpoint was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("experienceEndpointId is required") unless params.has_key?(:experienceEndpointId)

      query_params[:version] = params[:version] if params.has_key?(:version)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints/#{params[:experienceEndpointId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on resources linked to an experience endpoint
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoint.*, or experienceEndpoint.linkedResources.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} experienceEndpointId - ID associated with the experience endpoint
    # *  {string} version - Version of this experience endpoint to query
    # *  {string} includeCustomNodes - If the result of the request should also include the details of any custom nodes referenced by returned workflows
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Linked resource information (https://api.losant.com/#/definitions/experienceLinkedResources)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if experience endpoint was not found (https://api.losant.com/#/definitions/error)
    def linked_resources(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("experienceEndpointId is required") unless params.has_key?(:experienceEndpointId)

      query_params[:version] = params[:version] if params.has_key?(:version)
      query_params[:includeCustomNodes] = params[:includeCustomNodes] if params.has_key?(:includeCustomNodes)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints/#{params[:experienceEndpointId]}/linkedResources"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about an experience endpoint
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, experienceEndpoint.*, or experienceEndpoint.patch.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} experienceEndpointId - ID associated with the experience endpoint
    # *  {hash} experienceEndpoint - Object containing new properties of the experience endpoint (https://api.losant.com/#/definitions/experienceEndpointPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated experience endpoint information (https://api.losant.com/#/definitions/experienceEndpoint)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if experience endpoint was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("experienceEndpointId is required") unless params.has_key?(:experienceEndpointId)
      raise ArgumentError.new("experienceEndpoint is required") unless params.has_key?(:experienceEndpoint)

      body = params[:experienceEndpoint] if params.has_key?(:experienceEndpoint)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints/#{params[:experienceEndpointId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
