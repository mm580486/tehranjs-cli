require "webrick"
require "tehranjs/web/controller"
require "tehranjs/web/servlet"

module Tehranjs
  class CLI < Thor
    class Serve < Thor::Group



      desc "Serve start server"

      namespace :serve

      class_option :port,
                   aliases: "-p",
                   desc: "Server Port",
                   type: :numeric, default: 2525

      def Serve

server = WEBrick::HTTPServer.new(:Port => options[:port])

server.mount '/public', WEBrick::HTTPServlet::FileHandler,::File.join(::File.dirname(__FILE__),"..", 'web','views','public')
server.mount "/", Tehranjs::Web::Servlet

trap("INT") {
    server.shutdown
}

server.start


      end

    end
  end
end
