# The MIT License (MIT)
#
# Copyright (c) 2020 Losant IoT, Inc.
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

  # Class containing all the actions for the Instance Org Member Resource
  class InstanceOrgMember

    def initialize(client)
      @client = client
    end

    # Deletes an organization member
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceOrgMember.*, or instanceOrgMember.delete.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} userId - ID associated with the organization member
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If member was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization or member was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("userId is required") unless params.has_key?(:userId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/members/#{params[:userId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns an organization member
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceOrgMember.*, or instanceOrgMember.get.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} userId - ID associated with the organization member
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A single organization member (https://api.losant.com/#/definitions/instanceOrgMember)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if instance, organization, or member was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("userId is required") unless params.has_key?(:userId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/members/#{params[:userId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Modifies the role of an organization member
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceOrgMember.*, or instanceOrgMember.patch.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} userId - ID associated with the organization member
    # *  {hash} member - Object containing new member info (https://api.losant.com/#/definitions/instanceOrgMemberPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - The modified organization member (https://api.losant.com/#/definitions/instanceOrgMember)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization or member was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("userId is required") unless params.has_key?(:userId)
      raise ArgumentError.new("member is required") unless params.has_key?(:member)

      body = params[:member] if params.has_key?(:member)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/members/#{params[:userId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
