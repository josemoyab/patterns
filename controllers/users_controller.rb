require "active_record"
require "models/user"

class UsersController < ApplicationController
  def index
    User.all.each do |user|
      response.write "<p>#{user.name}</p>"
    end
  end
end