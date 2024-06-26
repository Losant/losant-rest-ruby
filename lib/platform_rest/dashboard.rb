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

  # Class containing all the actions for the Dashboard Resource
  class Dashboard

    def initialize(client)
      @client = client
    end

    # Deletes a dashboard
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.User, dashboard.*, or dashboard.delete.
    #
    # Parameters:
    # *  {string} dashboardId - ID of the associated dashboard
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If dashboard was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if dashboard was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("dashboardId is required") unless params.has_key?(:dashboardId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/dashboards/#{params[:dashboardId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on a dashboard
    #
    # Authentication:
    # No api access token is required to call this action.
    #
    # Parameters:
    # *  {string} dashboardId - ID of the associated dashboard
    # *  {string} password - Password for password-protected dashboards
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Dashboard information (https://api.losant.com/#/definitions/dashboard)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if dashboard was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("dashboardId is required") unless params.has_key?(:dashboardId)

      query_params[:password] = params[:password] if params.has_key?(:password)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/dashboards/#{params[:dashboardId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a dashboard
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.User, dashboard.*, or dashboard.patch.
    #
    # Parameters:
    # *  {string} dashboardId - ID of the associated dashboard
    # *  {hash} dashboard - Object containing new dashboard properties (https://api.losant.com/#/definitions/dashboardPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Update dashboard information (https://api.losant.com/#/definitions/dashboard)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if dashboard was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("dashboardId is required") unless params.has_key?(:dashboardId)
      raise ArgumentError.new("dashboard is required") unless params.has_key?(:dashboard)

      body = params[:dashboard] if params.has_key?(:dashboard)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/dashboards/#{params[:dashboardId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Sends a snapshot of a dashboard
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.User, dashboard.*, or dashboard.sendReport.
    #
    # Parameters:
    # *  {string} dashboardId - ID of the associated dashboard
    # *  {hash} reportConfig - Object containing report options (https://api.losant.com/#/definitions/dashboardSendReport)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  202 - If dashboard report was enqueued to be sent (https://api.losant.com/#/definitions/jobEnqueuedResult)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if dashboard was not found (https://api.losant.com/#/definitions/error)
    def send_report(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("dashboardId is required") unless params.has_key?(:dashboardId)
      raise ArgumentError.new("reportConfig is required") unless params.has_key?(:reportConfig)

      body = params[:reportConfig] if params.has_key?(:reportConfig)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/dashboards/#{params[:dashboardId]}"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Validates a context object against the dashboard's context configuration
    #
    # Authentication:
    # No api access token is required to call this action.
    #
    # Parameters:
    # *  {string} dashboardId - ID of the associated dashboard
    # *  {hash} ctx - The context object to validate (https://api.losant.com/#/definitions/dashboardContextInstance)
    # *  {string} password - Password for password-protected dashboards
    # *  {string} duration - Duration of data to fetch in milliseconds
    # *  {string} resolution - Resolution in milliseconds
    # *  {string} end - End timestamp of the data, in ms since epoch
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If context is valid (https://api.losant.com/#/definitions/validateContextSuccess)
    #
    # Errors:
    # *  400 - Error if context is invalid (https://api.losant.com/#/definitions/validateContextError)
    # *  404 - Error if dashboard or application was not found (https://api.losant.com/#/definitions/error)
    def validate_context(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("dashboardId is required") unless params.has_key?(:dashboardId)
      raise ArgumentError.new("ctx is required") unless params.has_key?(:ctx)

      body = params[:ctx] if params.has_key?(:ctx)
      query_params[:password] = params[:password] if params.has_key?(:password)
      query_params[:duration] = params[:duration] if params.has_key?(:duration)
      query_params[:resolution] = params[:resolution] if params.has_key?(:resolution)
      query_params[:end] = params[:end] if params.has_key?(:end)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/dashboards/#{params[:dashboardId]}/validateContext"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
