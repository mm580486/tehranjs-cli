require 'erb'
require_relative 'helper.rb'
require 'i18n'
require 'tehranjs/web/filter'

I18n.load_path = Dir[::File.join(::File.dirname(__FILE__),"views", 'locals','*.yml')]
I18n.backend.load_translations

I18n.config.available_locales = :en


module Tehranjs
    module Web
        class Controller

        def initialize flash=nil
            @flash=flash
        end    
        def index
            render 'index.html.erb'
        end

        def about
            render 'about.html.erb'
        end

        def new_article
            render 'new_article.html.erb'
        end
        
        def build_article response, params
            @params = params.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
            filename = parameterize([@params[:date],@params[:permalink]].join(' '),'-')
            if @params[:rw] == 'dl'
                response.content_type = "application/octet-stream"
                response.[]=('Content-Disposition',"attachment; filename='#{filename}.md'")
                render 'build_article.md.erb',false 
            else
                article=render 'build_article.md.erb',false 
                begin
                 File.open("#{Dir.pwd}/_posts/#{filename}.md", 'w') { |file| file.write(article) }
                 response.set_redirect(WEBrick::HTTPStatus::MovedPermanently, "/new_article?message=#{I18n.t('flash.successfull')}")  
                 
                rescue
                 response.set_redirect(WEBrick::HTTPStatus::MovedPermanently, "/new_article?message=#{I18n.t('flash.faile_to_write')}")  
                    
            end
            end
        end


        def version_label
            return Tehranjs::Identity.version_label
        end

         def not_found
            
        end

        def render template , layout=true
            @template = File.read(::File.join(::File.dirname(__FILE__),"views", template))
            @layout = File.read(::File.join(::File.dirname(__FILE__),"views", '_layouts','application.html.erb'))
            return ERB.new(@template).result(binding) unless layout
            templates = [@template, @layout]
            templates.inject(nil) do | prev, temp |
               _render(temp) { prev }
            end
        end

        def _render temp
            ERB.new(temp).result( binding )
        end

        end
    end
end
