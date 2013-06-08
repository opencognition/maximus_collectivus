class ApiController < ApplicationController
  def index
    all_routes = Rails.application.routes.routes
    @routes = all_routes.routes.collect do | route |
      reqs = route.requirements
      controller = reqs[:controller] || ':controller'
      action = reqs[:action] || ':action'
      constraints = reqs.except(:controller, :action)
      verb = route.verb.source.gsub(/[$^]/, '')
      {name: route.name.to_s, verb: verb, path: route.path.spec.to_s, reqs: reqs}
    end
    @routes.reject! { |r| r[:path].starts_with?("/rails/info/properties") || r[:path] == "#{Rails.application.config.assets.prefix}" }
    Rails.logger.error(@routes.inspect)
  end
end
