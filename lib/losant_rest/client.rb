# The MIT License (MIT)
#
# Copyright (c) 2019 Losant IoT, Inc.
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

require "httparty"

module LosantRest
  # Losant API
  #
  # User API for accessing Losant data
  #
  # Built For Version 1.16.1
  class Client
    attr_accessor :auth_token, :url

    def initialize(options = {})
      self.auth_token = options.fetch(:auth_token, nil)
      self.url        = options.fetch(:url, "https://api.losant.com")
    end

    def application
      @application ||= Application.new(self)
    end

    def application_api_token
      @application_api_token ||= ApplicationApiToken.new(self)
    end

    def application_api_tokens
      @application_api_tokens ||= ApplicationApiTokens.new(self)
    end

    def application_certificate
      @application_certificate ||= ApplicationCertificate.new(self)
    end

    def application_certificate_authorities
      @application_certificate_authorities ||= ApplicationCertificateAuthorities.new(self)
    end

    def application_certificate_authority
      @application_certificate_authority ||= ApplicationCertificateAuthority.new(self)
    end

    def application_certificates
      @application_certificates ||= ApplicationCertificates.new(self)
    end

    def application_key
      @application_key ||= ApplicationKey.new(self)
    end

    def application_keys
      @application_keys ||= ApplicationKeys.new(self)
    end

    def applications
      @applications ||= Applications.new(self)
    end

    def audit_log
      @audit_log ||= AuditLog.new(self)
    end

    def audit_logs
      @audit_logs ||= AuditLogs.new(self)
    end

    def auth
      @auth ||= Auth.new(self)
    end

    def dashboard
      @dashboard ||= Dashboard.new(self)
    end

    def dashboards
      @dashboards ||= Dashboards.new(self)
    end

    def data
      @data ||= Data.new(self)
    end

    def data_table
      @data_table ||= DataTable.new(self)
    end

    def data_table_row
      @data_table_row ||= DataTableRow.new(self)
    end

    def data_table_rows
      @data_table_rows ||= DataTableRows.new(self)
    end

    def data_tables
      @data_tables ||= DataTables.new(self)
    end

    def device
      @device ||= Device.new(self)
    end

    def device_recipe
      @device_recipe ||= DeviceRecipe.new(self)
    end

    def device_recipes
      @device_recipes ||= DeviceRecipes.new(self)
    end

    def devices
      @devices ||= Devices.new(self)
    end

    def edge_deployments
      @edge_deployments ||= EdgeDeployments.new(self)
    end

    def event
      @event ||= Event.new(self)
    end

    def events
      @events ||= Events.new(self)
    end

    def experience
      @experience ||= Experience.new(self)
    end

    def experience_domain
      @experience_domain ||= ExperienceDomain.new(self)
    end

    def experience_domains
      @experience_domains ||= ExperienceDomains.new(self)
    end

    def experience_endpoint
      @experience_endpoint ||= ExperienceEndpoint.new(self)
    end

    def experience_endpoints
      @experience_endpoints ||= ExperienceEndpoints.new(self)
    end

    def experience_group
      @experience_group ||= ExperienceGroup.new(self)
    end

    def experience_groups
      @experience_groups ||= ExperienceGroups.new(self)
    end

    def experience_slug
      @experience_slug ||= ExperienceSlug.new(self)
    end

    def experience_slugs
      @experience_slugs ||= ExperienceSlugs.new(self)
    end

    def experience_user
      @experience_user ||= ExperienceUser.new(self)
    end

    def experience_users
      @experience_users ||= ExperienceUsers.new(self)
    end

    def experience_version
      @experience_version ||= ExperienceVersion.new(self)
    end

    def experience_versions
      @experience_versions ||= ExperienceVersions.new(self)
    end

    def experience_view
      @experience_view ||= ExperienceView.new(self)
    end

    def experience_views
      @experience_views ||= ExperienceViews.new(self)
    end

    def file
      @file ||= File.new(self)
    end

    def files
      @files ||= Files.new(self)
    end

    def flow
      @flow ||= Flow.new(self)
    end

    def flow_version
      @flow_version ||= FlowVersion.new(self)
    end

    def flow_versions
      @flow_versions ||= FlowVersions.new(self)
    end

    def flows
      @flows ||= Flows.new(self)
    end

    def integration
      @integration ||= Integration.new(self)
    end

    def integrations
      @integrations ||= Integrations.new(self)
    end

    def me
      @me ||= Me.new(self)
    end

    def notebook
      @notebook ||= Notebook.new(self)
    end

    def notebooks
      @notebooks ||= Notebooks.new(self)
    end

    def org
      @org ||= Org.new(self)
    end

    def org_invites
      @org_invites ||= OrgInvites.new(self)
    end

    def orgs
      @orgs ||= Orgs.new(self)
    end

    def webhook
      @webhook ||= Webhook.new(self)
    end

    def webhooks
      @webhooks ||= Webhooks.new(self)
    end

    def request(options = {})
      headers = options.fetch(:headers, {})
      method  = options.fetch(:method, :get)

      headers["Accept"]         = "application/json"
      headers["Content-Type"]   = "application/json"
      headers["Accept-Version"] = "^1.16.1"
      headers["Authorization"]  = "Bearer #{self.auth_token}" if self.auth_token
      path = self.url + options.fetch(:path, "")

      response = HTTParty.send(method, path,
        query: Utils.fix_query_arrays(options[:query]),
        body: options[:body] && options[:body].to_json(),
        headers: headers)

      result = response.parsed_response
      if response.code >= 400
        raise ResponseError.new(response.code, result)
      end

      result
    end
  end
end
