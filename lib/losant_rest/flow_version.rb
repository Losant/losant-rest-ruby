# The MIT License (MIT)
#
# Copyright (c) 2021 Losant IoT, Inc.
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

  # Class containing all the actions for the Flow Version Resource
  class FlowVersion

    def initialize(client)
      @client = client
    end

    # Deletes a flow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, flowVersion.*, or flowVersion.delete.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If flow version was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Get information about errors that occurred during runs of this workflow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.errors.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} duration - Duration of time range in milliseconds
    # *  {string} end - End of time range in milliseconds since epoch
    # *  {string} limit - Maximum number of errors to return
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} deviceId - For edge workflows, the Device ID to return workflow errors for. When not included, will be errors for all device IDs.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Workflow error information (https://api.losant.com/#/definitions/flowErrors)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def errors(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)

      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:deviceId] = params[:deviceId] if params.has_key?(:deviceId)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}/errors"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on a flow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.get.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} includeCustomNodes - If the result of the request should also include the details of any custom nodes referenced by the returned workflows
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Flow version information (https://api.losant.com/#/definitions/flowVersion)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)

      query_params[:includeCustomNodes] = params[:includeCustomNodes] if params.has_key?(:includeCustomNodes)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the recent log entries about runs of this workflow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.log.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} limit - Max log entries to return (ordered by time descending)
    # *  {string} since - Look for log entries since this time (ms since epoch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent log entries (https://api.losant.com/#/definitions/flowLog)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def get_log_entries(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}/logs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a flow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, flowVersion.*, or flowVersion.patch.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} includeCustomNodes - If the result of the request should also include the details of any custom nodes referenced by the returned workflows
    # *  {hash} flowVersion - Object containing new properties of the flow version (https://api.losant.com/#/definitions/flowVersionPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated flow version information (https://api.losant.com/#/definitions/flowVersion)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)
      raise ArgumentError.new("flowVersion is required") unless params.has_key?(:flowVersion)

      query_params[:includeCustomNodes] = params[:includeCustomNodes] if params.has_key?(:includeCustomNodes)
      body = params[:flowVersion] if params.has_key?(:flowVersion)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Get statistics about workflow runs for this workflow version
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.stats.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} flowId - ID associated with the flow
    # *  {string} flowVersionId - Version ID or version name associated with the flow version
    # *  {string} duration - Duration of time range in milliseconds
    # *  {string} end - End of time range in milliseconds since epoch
    # *  {string} resolution - Resolution in milliseconds
    # *  {string} deviceId - For edge workflows, the device ID to return workflow stats for. When not included, will be aggregate for all device IDs.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Statistics for workflow runs (https://api.losant.com/#/definitions/flowStats)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if flow version was not found (https://api.losant.com/#/definitions/error)
    def stats(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("flowId is required") unless params.has_key?(:flowId)
      raise ArgumentError.new("flowVersionId is required") unless params.has_key?(:flowVersionId)

      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      query_params[:deviceId] = params[:deviceId] if params.has_key?(:deviceId)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/flows/#{params[:flowId]}/versions/#{params[:flowVersionId]}/stats"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
