class ApplicationController < Controller
  def index
    response.write "You said: " + request["text"]
  end
end