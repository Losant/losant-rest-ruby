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

  # Class containing all the actions for the Instance Sandbox Resource
  class InstanceSandbox

    def initialize(client)
      @client = client
    end

    # Deletes a sandbox user account
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceSandbox.*, or instanceSandbox.delete.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If a sandbox was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns device counts by day for the time range specified for all applications the sandbox user owns
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceSandbox.*, or instanceSandbox.deviceCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} start - Start of range for device count query (ms since epoch)
    # *  {string} end - End of range for device count query (ms since epoch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Device counts by day (https://api.losant.com/#/definitions/deviceCounts)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def device_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}/deviceCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns a sandbox user
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceSandbox.*, or instanceSandbox.get.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} summaryExclude - Comma-separated list of summary fields to exclude from user summary
    # *  {string} summaryInclude - Comma-separated list of summary fields to include in user summary
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A single sandbox user (https://api.losant.com/#/definitions/instanceSandbox)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:summaryExclude] = params[:summaryExclude] if params.has_key?(:summaryExclude)
      query_params[:summaryInclude] = params[:summaryInclude] if params.has_key?(:summaryInclude)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns notebook execution usage by day for the time range specified for all applications the sandbox user owns
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceSandbox.*, or instanceSandbox.notebookMinuteCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} start - Start of range for notebook execution query (ms since epoch)
    # *  {string} end - End of range for notebook execution query (ms since epoch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Notebook usage information (https://api.losant.com/#/definitions/notebookMinuteCounts)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def notebook_minute_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}/notebookMinuteCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts for the time range specified for all applications the sandbox user owns
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceSandbox.*, or instanceSandbox.payloadCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} start - Start of range for payload count query (ms since epoch)
    # *  {string} end - End of range for payload count query (ms since epoch)
    # *  {string} asBytes - If the resulting stats should be returned as bytes
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Payload counts, by type and source (https://api.losant.com/#/definitions/payloadStats)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def payload_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:asBytes] = params[:asBytes] if params.has_key?(:asBytes)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}/payloadCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts per resolution in the time range specified for all applications the sandbox user owns
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceSandbox.*, or instanceSandbox.payloadCountsBreakdown.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} start - Start of range for payload count query (ms since epoch)
    # *  {string} end - End of range for payload count query (ms since epoch)
    # *  {string} resolution - Resolution in milliseconds. Accepted values are: 86400000, 3600000
    # *  {string} asBytes - If the resulting stats should be returned as bytes
    # *  {string} includeNonBillable - If non-billable payloads should be included in the result
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Sum of payload counts by date (https://api.losant.com/#/definitions/payloadCountsBreakdown)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def payload_counts_breakdown(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      query_params[:asBytes] = params[:asBytes] if params.has_key?(:asBytes)
      query_params[:includeNonBillable] = params[:includeNonBillable] if params.has_key?(:includeNonBillable)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}/payloadCountsBreakdown"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Restores a sandbox user account
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceSandbox.*, or instanceSandbox.undelete.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} instanceSandboxId - ID associated with the sandbox user
    # *  {string} summaryExclude - Comma-separated list of summary fields to exclude from user summary
    # *  {string} summaryInclude - Comma-separated list of summary fields to include in user summary
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A single restored sandbox user (https://api.losant.com/#/definitions/instanceSandbox)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if sandbox or instance was not found (https://api.losant.com/#/definitions/error)
    def undelete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instanceSandboxId is required") unless params.has_key?(:instanceSandboxId)

      query_params[:summaryExclude] = params[:summaryExclude] if params.has_key?(:summaryExclude)
      query_params[:summaryInclude] = params[:summaryInclude] if params.has_key?(:summaryInclude)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/sandboxes/#{params[:instanceSandboxId]}/undelete"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
