require_relative "losant_rest/version"
require_relative "losant_rest/error"
require_relative "losant_rest/utils"
require_relative "losant_rest/access_token"
require_relative "losant_rest/access_tokens"
require_relative "losant_rest/application"
require_relative "losant_rest/application_key"
require_relative "losant_rest/application_keys"
require_relative "losant_rest/applications"
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
require_relative "losant_rest/orgs"
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
