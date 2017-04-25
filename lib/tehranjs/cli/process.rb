module Tehranjs
  class CLI < Thor
    class Process < Thor::Group


      desc "Serve start server"

      namespace :process
      
      class_option :port,
                   aliases: "-p",
                   desc: "Server Port",
                   type: :numeric, default: 580486

      map %w[-s serve] => :serve

      def serve

      end

    end
  end
end
