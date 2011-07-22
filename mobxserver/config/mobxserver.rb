require 'mysql2/em_fiber'

config['db'] = EM::Synchrony::ConnectionPool.new(:size => 20) do
    ::Mysql2::EM::Fiber::Client.new(:hostname => 'localhost', :username => 'test',
                                    :password => 'password', :socket => nil,
                                    :database => 'mobx_db',
                                    :reconnect => true)
end
