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

  # Class containing all the actions for the Device Resource
  class Device

    def initialize(client)
      @client = client
    end

    # Deletes a device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, device.*, or device.delete.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If device was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Creates a device data export. Defaults to all data.
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.export.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} start - Start time of export (ms since epoch - 0 means now, negative is relative to now)
    # *  {string} end - End time of export (ms since epoch - 0 means now, negative is relative to now)
    # *  {string} email - Email address to send export to. Defaults to current user's email.
    # *  {string} callbackUrl - Callback URL to call with export result
    # *  {string} includeBlobData - If set will export any blob attributes in base64 form, otherwise they will be downloadable links which will expire.
    # *  {hash} query - The export parameters. When provided overrides any options provided as a query param. (https://api.losant.com/#/definitions/deviceDataExport)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  202 - If generation of export was successfully started (https://api.losant.com/#/definitions/jobEnqueuedResult)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def export(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:email] = params[:email] if params.has_key?(:email)
      query_params[:callbackUrl] = params[:callbackUrl] if params.has_key?(:callbackUrl)
      query_params[:includeBlobData] = params[:includeBlobData] if params.has_key?(:includeBlobData)
      body = params[:query] if params.has_key?(:query)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/export"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on a device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.get.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} excludeConnectionInfo - If set, do not return connection info
    # *  {string} tagsAsObject - Return tags as an object map instead of an array
    # *  {string} attributesAsObject - Return attributes as an object map instead of an array
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Device information (https://api.losant.com/#/definitions/device)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:excludeConnectionInfo] = params[:excludeConnectionInfo] if params.has_key?(:excludeConnectionInfo)
      query_params[:tagsAsObject] = params[:tagsAsObject] if params.has_key?(:tagsAsObject)
      query_params[:attributesAsObject] = params[:attributesAsObject] if params.has_key?(:attributesAsObject)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the last known commands(s) sent to the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getCommand.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit - Maximum number of command entries to return
    # *  {string} since - (deprecated) Look for command entries since this time (ms since epoch)
    # *  {string} sortDirection - Direction to sort the command entries (by time). Accepted values are: asc, desc
    # *  {string} duration - Duration of time range to query in milliseconds
    # *  {string} start - Start of time range to query in milliseconds since epoch
    # *  {string} end - End of time range to query in milliseconds since epoch
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent device commands (https://api.losant.com/#/definitions/deviceCommands)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_command(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/command"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the composite last complete state of the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getCompositeState.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} start - Start of time range to look at to build composite state
    # *  {string} end - End of time range to look at to build composite state
    # *  {string} attributes - Comma-separated list of attributes to include. When not provided, returns all attributes.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Composite last state of the device (https://api.losant.com/#/definitions/compositeDeviceState)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_composite_state(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:attributes] = params[:attributes] if params.has_key?(:attributes)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/compositeState"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the recent log entries about the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getLogEntries.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit - Maximum number of log entries to return
    # *  {string} since - (deprecated) Look for log entries since this time (ms since epoch)
    # *  {string} sortDirection - Direction to sort the log entries (by time). Accepted values are: asc, desc
    # *  {string} duration - Duration of time range to query in milliseconds
    # *  {string} start - Start of time range to query in milliseconds since epoch
    # *  {string} end - End of time range to query in milliseconds since epoch
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent log entries (https://api.losant.com/#/definitions/deviceLog)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_log_entries(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/logs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieve the last known state(s) of the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getState.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} limit - Maximum number of state entries to return
    # *  {string} since - (deprecated) Look for state entries since this time (ms since epoch)
    # *  {string} sortDirection - Direction to sort the state entries (by time). Accepted values are: asc, desc
    # *  {string} duration - Duration of time range to query in milliseconds
    # *  {string} start - Start of time range to query in milliseconds since epoch
    # *  {string} end - End of time range to query in milliseconds since epoch
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Recent device states (https://api.losant.com/#/definitions/deviceStates)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def get_state(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:limit] = params[:limit] if params.has_key?(:limit)
      query_params[:since] = params[:since] if params.has_key?(:since)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/state"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, device.*, or device.patch.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} device - Object containing new properties of the device (https://api.losant.com/#/definitions/devicePatch)
    # *  {string} tagsAsObject - Return tags as an object map instead of an array
    # *  {string} attributesAsObject - Return attributes as an object map instead of an array
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated device information (https://api.losant.com/#/definitions/device)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("device is required") unless params.has_key?(:device)

      body = params[:device] if params.has_key?(:device)
      query_params[:tagsAsObject] = params[:tagsAsObject] if params.has_key?(:tagsAsObject)
      query_params[:attributesAsObject] = params[:attributesAsObject] if params.has_key?(:attributesAsObject)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts for the time range specified for this device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.payloadCounts.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} start - Start of range for payload count query (ms since epoch)
    # *  {string} end - End of range for payload count query (ms since epoch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Payload counts, by type (https://api.losant.com/#/definitions/devicePayloadCounts)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def payload_counts(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/payloadCounts"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns payload counts per resolution in the time range specified for this device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.payloadCountsBreakdown.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} start - Start of range for payload count query (ms since epoch)
    # *  {string} end - End of range for payload count query (ms since epoch)
    # *  {string} resolution - Resolution in milliseconds. Accepted values are: 86400000, 3600000
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
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def payload_counts_breakdown(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/payloadCountsBreakdown"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Removes all device data for the specified time range. Defaults to all data.
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Organization, all.User, device.*, or device.removeData.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {string} start - Start time of export (ms since epoch - 0 means now, negative is relative to now)
    # *  {string} end - End time of export (ms since epoch - 0 means now, negative is relative to now)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  202 - If data removal was successfully started (https://api.losant.com/#/definitions/jobEnqueuedResult)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def remove_data(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)

      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/data"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Send a command to a device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Device, all.Organization, all.User, device.*, or device.sendCommand.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} deviceCommand - Command to send to the device (https://api.losant.com/#/definitions/deviceCommand)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If command was successfully sent (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def send_command(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("deviceCommand is required") unless params.has_key?(:deviceCommand)

      body = params[:deviceCommand] if params.has_key?(:deviceCommand)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/command"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Send the current state of the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Device, all.Organization, all.User, device.*, or device.sendState.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} deviceState - A single device state object, or an array of device state objects (https://api.losant.com/#/definitions/deviceStateOrStates)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If state was successfully received (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def send_state(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("deviceState is required") unless params.has_key?(:deviceState)

      body = params[:deviceState] if params.has_key?(:deviceState)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/state"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Set the current connection status of the device
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Device, all.Organization, all.User, device.*, or device.setConnectionStatus.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} deviceId - ID associated with the device
    # *  {hash} connectionStatus - The current connection status of the device (https://api.losant.com/#/definitions/deviceConnectionStatus)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If connection status was successfully applied (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if device was not found (https://api.losant.com/#/definitions/error)
    def set_connection_status(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("deviceId is required") unless params.has_key?(:deviceId)
      raise ArgumentError.new("connectionStatus is required") unless params.has_key?(:connectionStatus)

      body = params[:connectionStatus] if params.has_key?(:connectionStatus)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/devices/#{params[:deviceId]}/setConnectionStatus"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
