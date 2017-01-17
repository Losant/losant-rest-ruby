# The MIT License (MIT)
#
# Copyright (c) 2017 Losant IoT, Inc.
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

require_relative "losant_rest/version"
require_relative "losant_rest/error"
require_relative "losant_rest/utils"
require_relative "losant_rest/access_token"
require_relative "losant_rest/access_tokens"
require_relative "losant_rest/application"
require_relative "losant_rest/application_key"
require_relative "losant_rest/application_keys"
require_relative "losant_rest/applications"
require_relative "losant_rest/audit_log"
require_relative "losant_rest/audit_logs"
require_relative "losant_rest/auth"
require_relative "losant_rest/dashboard"
require_relative "losant_rest/dashboards"
require_relative "losant_rest/data"
require_relative "losant_rest/device"
require_relative "losant_rest/device_recipe"
require_relative "losant_rest/device_recipes"
require_relative "losant_rest/devices"
require_relative "losant_rest/event"
require_relative "losant_rest/events"
require_relative "losant_rest/flow"
require_relative "losant_rest/flows"
require_relative "losant_rest/me"
require_relative "losant_rest/org"
require_relative "losant_rest/org_invites"
require_relative "losant_rest/orgs"
require_relative "losant_rest/solution"
require_relative "losant_rest/solution_user"
require_relative "losant_rest/solution_users"
require_relative "losant_rest/solutions"
require_relative "losant_rest/webhook"
require_relative "losant_rest/webhooks"
require_relative "losant_rest/client"

module LosantRest

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
