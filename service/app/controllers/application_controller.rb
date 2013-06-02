class ApplicationController < ActionController::Base
  protect_from_forgery 
  skip_before_filter :verify_authenticity_token
  before_filter CASClient::Frameworks::Rails::Filter

  def logout
    # optionally do some local cleanup here
    # ...
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
