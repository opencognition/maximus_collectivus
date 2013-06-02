module ActiveResourceWithCas
  module ClassMethods
    def element_path_with_auth(id, prefix_options = {}, query_options = nil)
      query_options = {} if query_options == nil
      if self.proxy_granting_ticket != nil
        service_url = "#{URI(self.site).scheme}://#{URI(self.site).host}#{element_path_without_auth(id, prefix_options, query_options)}"
        proxy_ticket = CASClient::Frameworks::Rails::Filter.client.request_proxy_ticket(self.proxy_granting_ticket, service_url)
        query_options.merge!({:ticket => proxy_ticket.ticket, :service => proxy_ticket.service})
      end
      element_path_without_auth(id, prefix_options, query_options)
    end
    def collection_path_with_auth(prefix_options = {}, query_options = nil)
      query_options = {} if query_options == nil
      if self.proxy_granting_ticket != nil
        service_url = "#{URI(self.site).scheme}://#{URI(self.site).host}#{collection_path_without_auth(prefix_options, query_options)}"
        proxy_ticket = CASClient::Frameworks::Rails::Filter.client.request_proxy_ticket(self.proxy_granting_ticket, service_url)
        query_options.merge!({:ticket => proxy_ticket.ticket, :service => proxy_ticket.service})
      end
      collection_path_without_auth(prefix_options, query_options)
    end
  end
  def self.included(base)
    base.class_eval do
      extend ClassMethods
      class << self
        alias_method_chain :element_path, :auth
        alias_method_chain :collection_path, :auth
        cattr_accessor :proxy_granting_ticket
      end
    end
  end
end
