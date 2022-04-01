require "router"
require "config/routes"
require "action_controller"
require "controllers/application_controller"

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process action_name

    response.finish
  end

  def route(path)
    Routes.route(path)
  end

  def load_controller_class(name)
    require "controllers/#{name}_controller"
    Object.const_get(name.capitalize + "Controller")
  end
end