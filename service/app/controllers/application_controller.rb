class ApplicationController < ActionController::Base
  protect_from_forgery 
  skip_before_filter    :verify_authenticity_token
  before_filter         CASClient::Frameworks::Rails::Filter
  before_filter         :set_default_active_record_parameters
  before_filter         :set_cas_user

  def logout
    # optionally do some local cleanup here
    # ...
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  # Helper method to get a proxy_ticket.
  # param: uri - a service URL that the proxy ticket will be associated with
  # return: ProxyTicket - a CAS proxy ticket object (for example ticket = proxy_ticket.ticket and service = proxy_ticket.service)
  def get_proxy_ticket(uri)
    service_uri = uri
    proxy_granting_ticket = session[:cas_pgt]
    CASClient::Frameworks::Rails::Filter.client.request_proxy_ticket(proxy_granting_ticket, service_uri)
  end

  def set_default_active_record_parameters
    @includes = params[:includes].class == Array ? params[:includes] : params[:includes].to_s.split(",")
    @conditions = params[:conditions].respond_to?("has_key?") ? params[:conditions] : {}
  end
  
  def set_cas_user
    @cas_user = User.find_by_email(session[:cas_user])
    User.user_id = @cas_user.id
  end
end
