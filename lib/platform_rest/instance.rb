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

  # Class containing all the actions for the Instance Resource
  class Instance

    def initialize(client)
      @client = client
    end

    # Returns device counts by day for the time range specified for this instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.deviceCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
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
    # *  404 - Error if instance was not found (https://api.losant.com/#/definitions/error)
    def device_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/deviceCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Generates a CSV report on instance stats
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.generateReport.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {hash} options - Object containing report configuration (https://api.losant.com/#/definitions/instanceReportOptionsPost)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  202 - If generation of report was successfully started (https://api.losant.com/#/definitions/jobEnqueuedResult)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def generate_report(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      body = params[:options] if params.has_key?(:options)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/generateReport"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns an instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.get.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A single instance (https://api.losant.com/#/definitions/instance)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if instance was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Return historical summary entries for an instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.historicalSummaries.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} month - Timestamp within the month to report a summary for.
    # *  {string} sortField - Field to sort the results by. Accepted values are: resourceId, currentPeriodStart
    # *  {string} sortDirection - Direction to sort the results in. Accepted values are: asc, desc
    # *  {string} page - Which page of results to return
    # *  {string} perPage - How many items to return per page
    # *  {string} filterField - Field to filter the results by. Blank or not provided means no filtering. Accepted values are: resourceType, resourceId, ownerId, ownerType
    # *  {string} filter - Filter to apply against the filtered field. Blank or not provided means no filtering.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of historical summaries (https://api.losant.com/#/definitions/historicalSummaries)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def historical_summaries(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:month] = params[:month] if params.has_key?(:month)
      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:page] = params[:page] if params.has_key?(:page)
      query_params[:perPage] = params[:perPage] if params.has_key?(:perPage)
      query_params[:filterField] = params[:filterField] if params.has_key?(:filterField)
      query_params[:filter] = params[:filter] if params.has_key?(:filter)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/historicalSummaries"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns notebook execution usage by day for the time range specified for this instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.notebookMinuteCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
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
    # *  404 - Error if instance was not found (https://api.losant.com/#/definitions/error)
    def notebook_minute_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/notebookMinuteCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about an instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instance.*, or instance.patch.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {hash} instance - Updated instance information (https://api.losant.com/#/definitions/instancePatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - The updated instance object (https://api.losant.com/#/definitions/instance)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("instance is required") unless params.has_key?(:instance)

      body = params[:instance] if params.has_key?(:instance)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts for the time range specified for this instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.payloadCounts.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
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
    # *  404 - Error if instance was not found (https://api.losant.com/#/definitions/error)
    def payload_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:asBytes] = params[:asBytes] if params.has_key?(:asBytes)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/payloadCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts per resolution in the time range specified for this instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instance.*, or instance.payloadCountsBreakdown.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
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
    # *  404 - Error if instance was not found (https://api.losant.com/#/definitions/error)
    def payload_counts_breakdown(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      query_params[:asBytes] = params[:asBytes] if params.has_key?(:asBytes)
      query_params[:includeNonBillable] = params[:includeNonBillable] if params.has_key?(:includeNonBillable)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/payloadCountsBreakdown"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
