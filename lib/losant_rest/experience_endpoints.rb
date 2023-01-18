# The MIT License (MIT)
#
# Copyright (c) 2023 Losant IoT, Inc.
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

  # Class containing all the actions for the Experience Endpoints Resource
  class ExperienceEndpoints

    def initialize(client)
      @client = client
    end

    # Returns the experience endpoints for an application
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.get.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} sortField - Field to sort the results by. Accepted values are: order, method, route, id, creationDate, requestCount, lastUpdated
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} filterField - Field to filter the results by. Blank or not provided means no filtering. Accepted values are: method, route
    # *  {string} filter - Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering.
    # *  {string} experienceGroupId - Filter endpoints to those only in the specified group
    # *  {string} requestCountDuration - If set, a count of recent requests is included on each endpoint for the duration requested (milliseconds)
    # *  {string} version - Return the experience endpoints belonging to this version
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of experience endpoints (https://api.losant.com/#/definitions/experienceEndpoints)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)

      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:filterField] = params[:filterField] if params.has_key?(:filterField)
      query_params[:filter] = params[:filter] if params.has_key?(:filter)
      query_params[:experienceGroupId] = params[:experienceGroupId] if params.has_key?(:experienceGroupId)
      query_params[:requestCountDuration] = params[:requestCountDuration] if params.has_key?(:requestCountDuration)
      query_params[:version] = params[:version] if params.has_key?(:version)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new experience endpoint for an application
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, experienceEndpoints.*, or experienceEndpoints.post.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} experienceEndpoint - New experience endpoint information (https://api.losant.com/#/definitions/experienceEndpointPost)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully created experience endpoint (https://api.losant.com/#/definitions/experienceEndpoint)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def post(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("experienceEndpoint is required") unless params.has_key?(:experienceEndpoint)

      body = params[:experienceEndpoint] if params.has_key?(:experienceEndpoint)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Get statistics about endpoint requests
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.stats.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} statGrouping - Field to group the statistics by. Accepted values are: statusCode, endpointId, version, domain
    # *  {string} duration - Duration in milliseconds
    # *  {string} end - End of time range in milliseconds since epoch
    # *  {string} resolution - Resolution in milliseconds
    # *  {string} versionFilter - Filters the stats to a particular experience version
    # *  {string} domainFilter - Filters the stats to a particular experience domain or slug
    # *  {string} statusCodeFilter - Filters the stats to a particular status code
    # *  {string} endpointIdFilter - Filters the stats to a particular endpoint
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Statistics for endpoint requests (https://api.losant.com/#/definitions/experienceEndpointStats)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def stats(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)

      query_params[:statGrouping] = params[:statGrouping] if params.has_key?(:statGrouping)
      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      query_params[:versionFilter] = params[:versionFilter] if params.has_key?(:versionFilter)
      query_params[:domainFilter] = params[:domainFilter] if params.has_key?(:domainFilter)
      query_params[:statusCodeFilter] = params[:statusCodeFilter] if params.has_key?(:statusCodeFilter)
      query_params[:endpointIdFilter] = params[:endpointIdFilter] if params.has_key?(:endpointIdFilter)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/experience/endpoints/stats"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
