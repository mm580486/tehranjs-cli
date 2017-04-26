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
                            when "/subtract"
                                result = MyNormalClass.subtract(a, b)
                            else
                                result = "No such method"
                        end
                        
                        response.body = result.to_s + "\n"
                
                end
        end
    end
end