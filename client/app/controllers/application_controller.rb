class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :set_proxy_granting_ticket

  def logout
    # optionally do some local cleanup here
    # ...
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def set_proxy_granting_ticket
    proxy_granting_ticket = session[:cas_pgt]
    Category.proxy_granting_ticket = proxy_granting_ticket
    CategoryTag.proxy_granting_ticket = proxy_granting_ticket
    Exercise.proxy_granting_ticket = proxy_granting_ticket
    Group.proxy_granting_ticket = proxy_granting_ticket
    Item.proxy_granting_ticket = proxy_granting_ticket
    Node.proxy_granting_ticket = proxy_granting_ticket
    NodeRoleAssignment.proxy_granting_ticket = proxy_granting_ticket
    Permission.proxy_granting_ticket = proxy_granting_ticket
    Role.proxy_granting_ticket = proxy_granting_ticket
    RolePermission.proxy_granting_ticket = proxy_granting_ticket
    Section.proxy_granting_ticket = proxy_granting_ticket
    Tag.proxy_granting_ticket = proxy_granting_ticket
    User.proxy_granting_ticket = proxy_granting_ticket
    UserGroup.proxy_granting_ticket = proxy_granting_ticket
  end

  def get_proxy_ticket(uri)
    service_uri = uri
    proxy_granting_ticket = session[:cas_pgt]
    CASClient::Frameworks::Rails::Filter.client.request_proxy_ticket(proxy_granting_ticket, service_uri)
  end
end
