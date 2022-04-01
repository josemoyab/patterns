Routes = {
  "GET" => {},
  "POST" => {}
}

class App
  def call(env)
    method = env["REQUEST_METHOD"]
    path = env["PATH_INFO"]
    body = Routes[method][path].call

    [
      200,
      {'Content-type' => 'text/plain'},
      [body]
    ]
  end
end

class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Calling #{env['PATH_INFO']}"
    @app.call(env)
  end
end

def get(path, &block)
  Routes["GET"][path] = block
end

# use Logger
run App.new

get "/hi" do
  "Owning"
end