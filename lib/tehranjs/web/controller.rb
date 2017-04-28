require 'erb'
require_relative 'helper.rb'
require 'i18n'

I18n.load_path = Dir[::File.join(::File.dirname(__FILE__),"views", 'locals','*.yml')]
I18n.backend.load_translations
I18n.config.available_locales = :en


module Tehranjs
    module Web
        class Controller

        def self.index
                self.render 'index.html.erb'
        end
        def self.about
                self.render 'about.html.erb'
        end

        def self.new_article
                self.render 'new_article.html.erb'
        end
        
        def self.build_article response, params
                @params = params.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
                filename = parameterize([@params[:date],@params[:title]].join(' '),'-')
                response.content_type = "application/octet-stream"
                response.[]=('Content-Disposition',"attachment; filename='#{filename}.md'")
                self.render 'build_article.md.erb',false 
        end


        def self.version_label
            return Tehranjs::Identity.version_label
        end

         def self.not_found
            
        end

        def self.render template , layout=true
            @template = File.read(::File.join(::File.dirname(__FILE__),"views", template))
            @layout = File.read(::File.join(::File.dirname(__FILE__),"views", '_layouts','application.html.erb'))
            return ERB.new(@template).result(binding) unless layout
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
