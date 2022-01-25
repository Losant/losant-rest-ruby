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

  # Class containing all the actions for the Instance Orgs Resource
  class InstanceOrgs

    def initialize(client)
      @client = client
    end

    # Returns the organizations associated with the current instance
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceOrgs.*, or instanceOrgs.get.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} sortField - Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} page - Which page of results to return
    # *  {string} perPage - How many items to return per page
    # *  {string} filterField - Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name
    # *  {string} filter - Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering.
    # *  {string} summaryInclude - Comma-separated list of summary fields to include in org summary
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A collection of organizations (https://api.losant.com/#/definitions/instanceOrgs)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:page] = params[:page] if params.has_key?(:page)
      query_params[:perPage] = params[:perPage] if params.has_key?(:perPage)
      query_params[:filterField] = params[:filterField] if params.has_key?(:filterField)
      query_params[:filter] = params[:filter] if params.has_key?(:filter)
      query_params[:summaryInclude] = params[:summaryInclude] if params.has_key?(:summaryInclude)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new organization
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceOrgs.*, or instanceOrgs.post.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} summaryInclude - Comma-separated list of summary fields to include in org summary
    # *  {hash} orgConfig - Object containing configurations for the new organization (https://api.losant.com/#/definitions/instanceOrgPost)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - The newly created organization (https://api.losant.com/#/definitions/org)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    def post(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)

      query_params[:summaryInclude] = params[:summaryInclude] if params.has_key?(:summaryInclude)
      body = params[:orgConfig] if params.has_key?(:orgConfig)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
