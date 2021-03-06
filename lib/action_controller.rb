require "filters"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(name)
      send name
    end

  end

  class Base < Metal
    include Filters
  end
end