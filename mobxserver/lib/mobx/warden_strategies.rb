require 'warden'

Warden::Strategies.add(:password) do
  def valid?
    params[:username] || params[:password]
  end

  def authenticate!
     success
#    u = User.authenticate(params[:username], params[:password])
#    u.nil? ? fail!("Could not log in") : success!(u)
  end
end