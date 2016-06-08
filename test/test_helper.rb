require "rubygems"

gem "minitest"
require "minitest/autorun"
require "minitest/spec"
require "minitest/mock"
require "webmock/minitest"
require "losant_rest"

class MiniTest::Test
  def setup
    WebMock.disable_net_connect!
  end
end
