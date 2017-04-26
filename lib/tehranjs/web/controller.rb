require 'erb'

module Tehranjs
    module Web
    class Controller
        def self.index
             self.render 'index.html.erb'
        end
        
        private
        def self.render template
            renderer = ERB.new(File.read(::File.join(::File.dirname(__FILE__),"views", template)))
            return renderer.result()
        end

    end

    end

end
