require "webrick"
require 'i18n'
require "tehranjs/web/controller"
require "tehranjs/web/servlet"
module Tehranjs
  class CLI < Thor
    class Serve < Thor::Group
    check_unknown_options!


      desc "Serve start server"

      namespace :serve

      class_option :port,
                   aliases: "-p",
                   desc: "Server Port",
                   type: :numeric, default: 2525

      class_option :lang,
                   aliases: "-l",
                   desc: "Server lang",
                   type: :string, default: 'en'

      def Serve
        I18n.load_path = Dir[::File.join(::File.dirname(__FILE__),"..","web","views", 'locals','*.yml')]
        I18n.default_locale = options[:lang].to_sym
        say("#{options[:lang].to_sym} localiziation")
        say("Server run at http://127.0.0.1:#{options[:port]}")
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
