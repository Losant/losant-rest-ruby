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

  # Class containing all the actions for the Private File Resource
  class PrivateFile

    def initialize(client)
      @client = client
    end

    # Deletes a private file or directory, if a directory all the contents that directory will also be removed.
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, privateFile.*, or privateFile.delete.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} privateFileId - ID associated with the private file
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If private file was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if private file was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("privateFileId is required") unless params.has_key?(:privateFileId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/privateFiles/#{params[:privateFileId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on a private file
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.cli, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.cli, all.User.read, privateFile.*, or privateFile.get.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} privateFileId - ID associated with the private file
    # *  {string} urlTTL - Time in seconds that the private file url will be valid for. Only applies to private files of type 'file'. If 0, no url will be returned.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Private file information (https://api.losant.com/#/definitions/file)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if private file was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("privateFileId is required") unless params.has_key?(:privateFileId)

      query_params[:urlTTL] = params[:urlTTL] if params.has_key?(:urlTTL)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/privateFiles/#{params[:privateFileId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Move a private file or the entire contents of a directory
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, privateFile.*, or privateFile.move.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} privateFileId - ID associated with the private file
    # *  {undefined} name - The new name of the private file or directory
    # *  {undefined} parentDirectory - The new parent directory for the private file or directory to move into.
    # *  {string} urlTTL - Time in seconds that the private file url will be valid for. Only applies to private files of type 'file'. If 0, no url will be returned.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Returns a new private file or directory that was created by the move, if a directory a job will kick off to move all the directories children. (https://api.losant.com/#/definitions/file)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if private file was not found (https://api.losant.com/#/definitions/error)
    def move(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("privateFileId is required") unless params.has_key?(:privateFileId)

      query_params[:name] = params[:name] if params.has_key?(:name)
      query_params[:parentDirectory] = params[:parentDirectory] if params.has_key?(:parentDirectory)
      query_params[:urlTTL] = params[:urlTTL] if params.has_key?(:urlTTL)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/privateFiles/#{params[:privateFileId]}/move"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Reupload a private file
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Application, all.Application.cli, all.Organization, all.User, all.User.cli, privateFile.*, or privateFile.patch.
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} privateFileId - ID associated with the private file
    # *  {hash} updates - Updated information about the private file (https://api.losant.com/#/definitions/filePatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully updated private file and the information needed to upload the file content (https://api.losant.com/#/definitions/fileUploadPostResponse)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if private file was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("privateFileId is required") unless params.has_key?(:privateFileId)
      raise ArgumentError.new("updates is required") unless params.has_key?(:updates)

      body = params[:updates] if params.has_key?(:updates)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/privateFiles/#{params[:privateFileId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
