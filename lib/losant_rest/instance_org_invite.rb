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

  # Class containing all the actions for the Instance Org Invite Resource
  class InstanceOrgInvite

    def initialize(client)
      @client = client
    end

    # Revokes an instance org invitation
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceOrgInvite.*, or instanceOrgInvite.delete.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} inviteId - ID associated with the organization invite
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If an invite was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if instance, organization or invite was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("inviteId is required") unless params.has_key?(:inviteId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/invites/#{params[:inviteId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Returns an organization invite
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.Instance.read, all.User, all.User.read, instanceOrgInvite.*, or instanceOrgInvite.get.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} inviteId - ID associated with the organization invite
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - A single organization invite (https://api.losant.com/#/definitions/orgInvite)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if instance, organization, or invite was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("inviteId is required") unless params.has_key?(:inviteId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/invites/#{params[:inviteId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Resend an organization invite with modified role info
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Instance, all.User, instanceOrgInvite.*, or instanceOrgInvite.resendInvite.
    #
    # Parameters:
    # *  {string} instanceId - ID associated with the instance
    # *  {string} orgId - ID associated with the organization
    # *  {string} inviteId - ID associated with the organization invite
    # *  {hash} roleInfo - Object containing updated role info (https://api.losant.com/#/definitions/orgRoleInfo)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - The new org invite (https://api.losant.com/#/definitions/orgInvite)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if instance, organization, or invite was not found (https://api.losant.com/#/definitions/error)
    def resend_invite(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("instanceId is required") unless params.has_key?(:instanceId)
      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("inviteId is required") unless params.has_key?(:inviteId)
      raise ArgumentError.new("roleInfo is required") unless params.has_key?(:roleInfo)

      body = params[:roleInfo] if params.has_key?(:roleInfo)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/instances/#{params[:instanceId]}/orgs/#{params[:orgId]}/invites/#{params[:inviteId]}"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
