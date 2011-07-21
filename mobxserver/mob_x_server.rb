#!/usr/bin/env ruby
#$:<< '../lib' << 'lib'
$:<< 'lib'

require 'goliath/application'
require 'goliath/api'
require 'goliath/rack/async_middleware'
require 'warden'

require 'mobx/warden_strategies'

# Entry point to start the mobx server
# 
# mobx server is designed to be running behind web servers. It will serve short-lived
# and long-lived connections based on http.
#
# 

# Our custom Goliath API
class HelloWorld < Goliath::API
  def response(env)
    env['warden'].authenticate! 
    [200, {}, "hello world!"]
  end
end

# Another Goliath API
class Bonjour < Goliath::API
  def response(env)
    [200, {}, "bonjour!"]
  end
end

class LoginFailure < Goliath::API
  def response(env)
    [503, {}, "Incorrect login credentials"]
  end
end


class MobXServer < Goliath::API

  # Rack builder acting as a router
  use Rack::Session::Cookie, :secret => "hnke738nfj2uya993u3hngw8hh3yu4u4n17"

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = LoginFailure.new
  end
  
  Warden::Manager.serialize_into_session do |user|
    user.id
  end

  Warden::Manager.serialize_from_session do |id|
    User.get(id)
  end
      
  # Rack end point
  map '/version' do
    use ::Rack::ContentLength
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Version 0.1"]] }
  end

  # map the /hello_world uri to our Goliath API
  map "/hello_world" do
    use ::Rack::ContentLength
    run HelloWorld.new
  end

  # map the /bonjour uri to our other Goliath API
  map "/bonjour" do
    use ::Rack::ContentLength
    run Bonjour.new
  end

  # catch the root route and return a 404
  map "/" do
    use ::Rack::ContentLength
    run Proc.new {|env| [404, {"Content-Type" => "text/html"}, ["Try /version /hello_world or /bonjour"]] }
  end

  # You must use either maps or response, but never both!
  def response(env)
    raise RuntimeException.new("#response is ignored when using maps, so this exception won't raise. See spec/integration/rack_routes_spec.")
  end

end
