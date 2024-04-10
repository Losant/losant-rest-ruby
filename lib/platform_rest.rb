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

require_relative "platform_rest/version"
require_relative "platform_rest/error"
require_relative "platform_rest/utils"
require_relative "platform_rest/application"
require_relative "platform_rest/application_api_token"
require_relative "platform_rest/application_api_tokens"
require_relative "platform_rest/application_certificate"
require_relative "platform_rest/application_certificate_authorities"
require_relative "platform_rest/application_certificate_authority"
require_relative "platform_rest/application_certificates"
require_relative "platform_rest/application_dashboard"
require_relative "platform_rest/application_dashboards"
require_relative "platform_rest/application_key"
require_relative "platform_rest/application_keys"
require_relative "platform_rest/application_template"
require_relative "platform_rest/application_templates"
require_relative "platform_rest/applications"
require_relative "platform_rest/audit_log"
require_relative "platform_rest/audit_logs"
require_relative "platform_rest/auth"
require_relative "platform_rest/credential"
require_relative "platform_rest/credentials"
require_relative "platform_rest/dashboard"
require_relative "platform_rest/dashboards"
require_relative "platform_rest/data"
require_relative "platform_rest/data_table"
require_relative "platform_rest/data_table_row"
require_relative "platform_rest/data_table_rows"
require_relative "platform_rest/data_tables"
require_relative "platform_rest/device"
require_relative "platform_rest/device_recipe"
require_relative "platform_rest/device_recipes"
require_relative "platform_rest/devices"
require_relative "platform_rest/edge_deployment"
require_relative "platform_rest/edge_deployments"
require_relative "platform_rest/embedded_deployment"
require_relative "platform_rest/embedded_deployments"
require_relative "platform_rest/event"
require_relative "platform_rest/events"
require_relative "platform_rest/experience"
require_relative "platform_rest/experience_domain"
require_relative "platform_rest/experience_domains"
require_relative "platform_rest/experience_endpoint"
require_relative "platform_rest/experience_endpoints"
require_relative "platform_rest/experience_group"
require_relative "platform_rest/experience_groups"
require_relative "platform_rest/experience_slug"
require_relative "platform_rest/experience_slugs"
require_relative "platform_rest/experience_user"
require_relative "platform_rest/experience_users"
require_relative "platform_rest/experience_version"
require_relative "platform_rest/experience_versions"
require_relative "platform_rest/experience_view"
require_relative "platform_rest/experience_views"
require_relative "platform_rest/file"
require_relative "platform_rest/files"
require_relative "platform_rest/flow"
require_relative "platform_rest/flow_version"
require_relative "platform_rest/flow_versions"
require_relative "platform_rest/flows"
require_relative "platform_rest/instance"
require_relative "platform_rest/instance_api_token"
require_relative "platform_rest/instance_api_tokens"
require_relative "platform_rest/instance_audit_log"
require_relative "platform_rest/instance_audit_logs"
require_relative "platform_rest/instance_custom_node"
require_relative "platform_rest/instance_custom_nodes"
require_relative "platform_rest/instance_member"
require_relative "platform_rest/instance_members"
require_relative "platform_rest/instance_org"
require_relative "platform_rest/instance_org_invite"
require_relative "platform_rest/instance_org_invites"
require_relative "platform_rest/instance_org_member"
require_relative "platform_rest/instance_org_members"
require_relative "platform_rest/instance_orgs"
require_relative "platform_rest/instance_sandbox"
require_relative "platform_rest/instance_sandboxes"
require_relative "platform_rest/instances"
require_relative "platform_rest/integration"
require_relative "platform_rest/integrations"
require_relative "platform_rest/me"
require_relative "platform_rest/notebook"
require_relative "platform_rest/notebooks"
require_relative "platform_rest/org"
require_relative "platform_rest/org_invites"
require_relative "platform_rest/orgs"
require_relative "platform_rest/resource_job"
require_relative "platform_rest/resource_jobs"
require_relative "platform_rest/user_api_token"
require_relative "platform_rest/user_api_tokens"
require_relative "platform_rest/webhook"
require_relative "platform_rest/webhooks"
require_relative "platform_rest/client"

module PlatformRest

  def self.client
    @client ||= Client.new
  end

  def self.method_missing(sym, *args, &block)
    self.client.__send__(sym, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    self.client.respond_to?(method_name, include_private)
  end

end
