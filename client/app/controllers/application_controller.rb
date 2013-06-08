class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :set_proxy_granting_ticket
  before_filter :set_default_active_record_parameters
  require 'rest_client'

  def logout
    # optionally do some local cleanup here
    # ...
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  # Helper method to get a proxy_ticket.
  # param: url - a service URL that the proxy ticket will be associated with
  # return: ProxyTicket - a CAS proxy ticket object (for example ticket = proxy_ticket.ticket and service = proxy_ticket.service)
  def get_proxy_ticket(url)
    service_url = url
    proxy_granting_ticket = session[:cas_pgt]
    CASClient::Frameworks::Rails::Filter.client.request_proxy_ticket(proxy_granting_ticket, service_url)
  end

  # Sets the proxy_granting_ticket Class attribute required for activeresource CAS authentication
  def set_proxy_granting_ticket
    proxy_granting_ticket = session[:cas_pgt]
    Category.proxy_granting_ticket            = proxy_granting_ticket
    CategoryTag.proxy_granting_ticket         = proxy_granting_ticket
    Exercise.proxy_granting_ticket            = proxy_granting_ticket
    Group.proxy_granting_ticket               = proxy_granting_ticket
    Item.proxy_granting_ticket                = proxy_granting_ticket
    Node.proxy_granting_ticket                = proxy_granting_ticket
    NodeRoleAssignment.proxy_granting_ticket  = proxy_granting_ticket
    Permission.proxy_granting_ticket          = proxy_granting_ticket
    Role.proxy_granting_ticket                = proxy_granting_ticket
    RolePermission.proxy_granting_ticket      = proxy_granting_ticket
    Section.proxy_granting_ticket             = proxy_granting_ticket
    Tag.proxy_granting_ticket                 = proxy_granting_ticket
    User.proxy_granting_ticket                = proxy_granting_ticket
    UserGroup.proxy_granting_ticket           = proxy_granting_ticket
  end

  def set_default_active_record_parameters
    @includes = params[:includes].class == Array ? params[:includes] : params[:includes].to_s.split(",")
    @conditions = params[:conditions].respond_to?("has_key?") ? params[:conditions] : {}
  end

end
