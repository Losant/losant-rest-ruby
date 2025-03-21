# The MIT License (MIT)
#
# Copyright (c) 2024 Losant IoT, Inc.
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

module PlatformRest

  # Class containing all the actions for the Experience Resource
  class Experience

    def initialize(client)
      @client = client
    end

    # Bootstraps the experience for this application with standard endpoints and views
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, experience.*, or experience.bootstrap.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} options - Bootstrap options (https://api.losant.com/#/definitions/experienceBootstrapOptions)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If bootstrap was successful (https://api.losant.com/#/definitions/experienceBootstrapResult)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def bootstrap(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("options is required") unless params.has_key?(:options)

      body = params[:options] if params.has_key?(:options)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/bootstrap"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Deletes multiple parts of an experience including users, groups, slugs, domains, versions, endpoints, views, and workflows
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, experience.*, or experience.delete.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} keepUsers - If this is set, Experience Users will not be removed.
    # *  {string} keepGroups - If this is set, Experience Groups will not be removed.
    # *  {string} keepSlugs - If this is set, Experience Slugs will not be removed.
    # *  {string} keepDomains - If this is set, Experience Domains will not be removed.
    # *  {string} removeVersions - If this is set, all Experience Versions and their contents will be removed (except for develop).
    # *  {string} keepViews - If this is set, Experience Views (in the develop version) will not be removed.
    # *  {string} keepEndpoints - If this is set, Experience Endpoints (in the develop version) will not be removed.
    # *  {string} removeWorkflows - If this is set, all Experience Workflows (in the develop version) will ve removed.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If deletion was successful (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)

      query_params[:keepUsers] = params[:keepUsers] if params.has_key?(:keepUsers)
      query_params[:keepGroups] = params[:keepGroups] if params.has_key?(:keepGroups)
      query_params[:keepSlugs] = params[:keepSlugs] if params.has_key?(:keepSlugs)
      query_params[:keepDomains] = params[:keepDomains] if params.has_key?(:keepDomains)
      query_params[:removeVersions] = params[:removeVersions] if params.has_key?(:removeVersions)
      query_params[:keepViews] = params[:keepViews] if params.has_key?(:keepViews)
      query_params[:keepEndpoints] = params[:keepEndpoints] if params.has_key?(:keepEndpoints)
      query_params[:removeWorkflows] = params[:removeWorkflows] if params.has_key?(:removeWorkflows)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
