require 'erb'

module Tehranjs
    module Web
        class Controller
            
        def self.index
                self.render 'index.html.erb'
        end
            
        def self.render template
            @layout = File.read(::File.join(::File.dirname(__FILE__),"views", '_layouts','application.html.erb'))
            @template = File.read(::File.join(::File.dirname(__FILE__),"views", template))
            templates = [@template, @layout]
            templates.inject(nil) do | prev, temp |
            self._render(temp) { prev }
            end
        end

        def self._render temp
            ERB.new(temp).result( binding )
        end

        end
    end
end
