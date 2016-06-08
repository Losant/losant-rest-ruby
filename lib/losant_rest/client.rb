require "httparty"

module LosantRest
  # Losant API
  #
  # User API for accessing Losant data
  #
  # Built For Version 1.3.8
  class Client
    attr_accessor :auth_token, :url

    def initialize(options = {})
      self.auth_token = options.fetch(:auth_token, nil)
      self.url        = options.fetch(:url, "https://api.losant.com")
    end

    def access_token
      return @access_token ||= AccessToken.new(self)
    end

    def access_tokens
      return @access_tokens ||= AccessTokens.new(self)
    end

    def application_key
      return @application_key ||= ApplicationKey.new(self)
    end

    def application_keys
      return @application_keys ||= ApplicationKeys.new(self)
    end

    def application
      return @application ||= Application.new(self)
    end

    def applications
      return @applications ||= Applications.new(self)
    end

    def auth
      return @auth ||= Auth.new(self)
    end

    def dashboard
      return @dashboard ||= Dashboard.new(self)
    end

    def dashboards
      return @dashboards ||= Dashboards.new(self)
    end

    def data
      return @data ||= Data.new(self)
    end

    def device
      return @device ||= Device.new(self)
    end

    def devices
      return @devices ||= Devices.new(self)
    end

    def device_recipe
      return @device_recipe ||= DeviceRecipe.new(self)
    end

    def device_recipes
      return @device_recipes ||= DeviceRecipes.new(self)
    end

    def event
      return @event ||= Event.new(self)
    end

    def events
      return @events ||= Events.new(self)
    end

    def flow
      return @flow ||= Flow.new(self)
    end

    def flows
      return @flows ||= Flows.new(self)
    end

    def me
      return @me ||= Me.new(self)
    end

    def org
      return @org ||= Org.new(self)
    end

    def orgs
      return @orgs ||= Orgs.new(self)
    end

    def webhook
      return @webhook ||= Webhook.new(self)
    end

    def webhooks
      return @webhooks ||= Webhooks.new(self)
    end


    def request(options = {})
      headers = options.fetch(:headers, {})
      method  = options.fetch(:method, :get)

      headers["Accept"]         = "application/json"
      headers["Content-Type"]   = "application/json"
      headers["Accept-Version"] = "^1.3.8"
      headers["Authorization"]  = "Bearer #{self.auth_token}" if self.auth_token
      path = self.url + options.fetch(:path, "")

      response = HTTParty.send(method, path,
        query: fix_query_arrays(options[:query]),
        body: options[:body] && options[:body].to_json(),
        headers: headers)

      result = response.parsed_response
      if response.code >= 400
        raise ResponseError.new(response.code, result)
      end

      result
    end

    def fix_query_arrays(value)
      if value.respond_to?(:to_ary)
        value = value.to_ary.map.with_index.to_a.to_h.invert
      end

      if value.respond_to?(:to_hash)
        value = value.to_hash
        value.each do |k, v|
          value[k] = fix_query_arrays(v)
        end
      end

      value
    end
  end
end
