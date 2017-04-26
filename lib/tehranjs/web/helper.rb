def content_tag(element=:div,content=nil,single=false,attr={})
    element = element.to_s.downcase
    attrs= attr.map {|k, v| "#{k}='#{v}'" }.join(' ')
    unless single
        tag= "<#{element} #{attrs}>"
        tag << content unless content.nil?
        tag << "</#{element}>"
    else
       tag= "<#{element} #{attrs}/>" 
    end
    return tag
end

def image_tag asset_path
    return content_tag(:img,'',single=true,{src: "/public/assets/img/#{asset_path}",width: "65" })
end

def stylesheets_link_tag asset_path
   return content_tag(:link,'',single=true,{href: "/public/assets/css/#{asset_path}" ,media: "all" ,rel: "stylesheet"})
end

def javascript_link_tag asset_path
   return content_tag(:script,'',single=false,{src: "/public/assets/js/#{asset_path}"})
end