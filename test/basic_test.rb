require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class BasicTest < MiniTest::Test
  describe "test basic functionality" do

    it "should correctly make an auth call" do
      stub_request(:post,
        "https://api.losant.com/auth/user?_actions=false&_embedded=true&_links=true")
        .with(body: '{"email":"myemail@myemail.com","password":"mypassword"}',
        headers: {'Accept'=>'application/json', 'Accept-Version'=>'^1.3.8'}).
        to_return(body: '{ "userId": "theUserId", "token": "an auth token string"}',
          status: 200, headers: { 'Content-Type': 'application/json' });

      client = LosantRest::Client.new

      response = client.auth.authenticate_user(credentials: {
        email: "myemail@myemail.com",
        password: "mypassword"
      })
      assert_equal response, { "userId" => "theUserId", "token" => "an auth token string" }
    end

    it "should correctly make a call with a token" do
      stub_request(:get,
        "https://api.losant.com/applications?_actions=false&_embedded=true&_links=true")
        .with(headers: {'Accept' => 'application/json',
          'Accept-Version' => '^1.3.8', 'Authorization' => 'Bearer my token'}).
        to_return(body: '{ "count": 0, "items": [] }',
          status: 200, headers: { 'Content-Type': 'application/json' });

      client = LosantRest::Client.new(auth_token: 'my token')

      response = client.applications.get
      assert_equal response, { "count" => 0, "items" => [] }
    end

    it "should correctly make calls with nested query params" do
      stub_request(:get,
        "https://api.losant.com/applications/appId/devices?_actions=false&_links=true&_embedded=true&tagFilter[0][key]=key2&tagFilter[1][key]=key1&tagFilter[1][value]=value1&tagFilter[2][value]=value2")
        .with(headers: {'Accept' => 'application/json',
          'Accept-Version' => '^1.3.8', 'Authorization' => 'Bearer my token'}).
        to_return(body: '{ "count": 0, "items": [] }',
          status: 200, headers: { 'Content-Type': 'application/json' });

      client = LosantRest::Client.new(auth_token: 'my token')

      response = client.devices.get(applicationId: 'appId', tagFilter: [
        { key: 'key2' },
        { key: 'key1', value: 'value1' },
        { value: 'value2' },
      ])
      assert_equal response, { "count" => 0, "items" => [] }
    end

    it "should correctly make a call with the singleton" do
      stub_request(:get,
        "https://api.losant.com/applications?_actions=false&_embedded=true&_links=true")
        .with(headers: {'Accept' => 'application/json',
          'Accept-Version' => '^1.3.8', 'Authorization' => 'Bearer my token'}).
        to_return(body: '{ "count": 0, "items": [] }',
          status: 200, headers: { 'Content-Type': 'application/json' });

      LosantRest.client.auth_token = 'my token'

      response = LosantRest.applications.get
      assert_equal response, { "count" => 0, "items" => [] }
    end

  end
end
