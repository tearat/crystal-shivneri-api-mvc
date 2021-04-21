require "shivneri"
require "./routes/routes"

include Rest

module Rest
  VERSION = "0.1.0"
  Shivneri.routes = routes
  Shivneri.port = 8000
  Shivneri.open do
    puts "App is started on http://localhost:#{Shivneri.port}"
  end
end