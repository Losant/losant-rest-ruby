require "httparty"

module LosantRest
  # Losant API
  #
  # User API for accessing Losant data
  #
  # Built For Version 1.3.9
  class Client
    attr_accessor :auth_token, :url

    def initialize(options = {})
      self.auth_token = options.fetch(:auth_token, nil)
      self.url        = options.fetch(:url, "https://api.losant.com")
    end

    def access_token
      @access_token ||= AccessToken.new(self)
    end

    def access_tokens
      @access_tokens ||= AccessTokens.new(self)
    end

    def application
      @application ||= Application.new(self)
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

    def event
      @event ||= Event.new(self)
    end

    def events
      @events ||= Events.new(self)
    end

    def flow
      @flow ||= Flow.new(self)
    end

    def flows
      @flows ||= Flows.new(self)
    end

    def me
      @me ||= Me.new(self)
    end

    def org
      @org ||= Org.new(self)
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
      headers["Accept-Version"] = "^1.3.9"
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
