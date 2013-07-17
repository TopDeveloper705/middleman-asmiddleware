require "middleman/as_middleware/version"
require "middleman/rack"

module Middleman
  class AsMiddleware

    def initialize app, server = Middleman.server
      @app, @server = app, server
    end

    def call env
      status, headers, body = *(response = @server.call env.dup)
      if status == 404
        @app.call env
      else
        response
      end
    end

  end
end
