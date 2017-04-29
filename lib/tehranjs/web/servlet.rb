module Tehranjs    
    module Web
        class Servlet < WEBrick::HTTPServlet::AbstractServlet
        attr_reader :flash_bang
                def do_GET (request, response)
                        response.status = 200
                        response.content_type = "text/html"
                        result = nil
                        @flash=request.query['message']
                        @controller= Tehranjs::Web::Controller.new(@flash)
                        case request.path
                            when "/"
                                result = @controller.index
                            when "/about"
                                result = @controller.about
                            when "/new_article"
                                result = @controller.new_article
                            else
                                result = "No such method"
                        end
                        
                        response.body = result
                end


                def do_POST(request, response)
                    response.status = 200
                    response.content_type = "text/html"
                    case request.path
                      when "/build_article"
                           result = Tehranjs::Web::Controller.new.build_article(response,request.query)   
                      else
                        result = 'Invalid url'
                    end
        
 response.body = result

                end



        end
    end
end
