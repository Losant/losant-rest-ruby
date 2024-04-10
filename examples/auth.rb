require "losant_rest"

client = PlatformRest::Client.new

user_response = client.auth.authenticate_user(credentials: {
  email: "example@losant.com",
  password: "your_password"
})

puts user_response
# Example user result
# {
#   "token"  => "an auth token string",
#   "userId" => "theUserId"
# }


device_response = client.auth.authenticate_device(credentials: {
  deviceId: "myDeviceId",
  key: "my_app_access_key",
  secret: "my_app_access_secret"
})

puts device_response
# Example device result
# {
#   "applicationId" => "myAppId",
#   "token"         => "an auth token string",
#   "restricted"    => false,
#   "deviceId"      => "myDeviceId",
#   "deviceClass"   => "standalone"
# }
