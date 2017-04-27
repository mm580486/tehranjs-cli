module Tehranjs    
    module Web
        class Servlet < WEBrick::HTTPServlet::AbstractServlet

                def do_GET (request, response)
                        response.status = 200
                        response.content_type = "text/html"
                        
                        result = nil
                        
                        case request.path
                            when "/"
                                result = Tehranjs::Web::Controller.index
                            when "/about"
                                result = Tehranjs::Web::Controller.about
                            when "/new_article"
                                result = Tehranjs::Web::Controller.new_article
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
                           result = Tehranjs::Web::Controller.build_article(response,request.query)   
                      else
                        result = 'Invalid url'
                    end
        
 response.body = result

                end



        end
    end
end
