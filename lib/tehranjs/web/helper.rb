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

def partial template
    template = ('_'+template.gsub('.html','')+'.html.erb') 
    template = File.read(::File.join(::File.dirname(__FILE__),"views","_partials", template))
    return ERB.new(template).result( )
end


def parameterize(string, sep = '-')
    # replace non-standaed character with question mark
    parameterized_string = I18n.transliterate(string)
    # remove all question mark
    parameterized_string.gsub!('?','')
    # Turn unwanted chars into the separator
    parameterized_string.gsub!(/[^a-z0-9A-Z\-_]+/, sep)

    unless sep.nil? || sep.empty?
    re_sep = Regexp.escape(sep)
    # No more than one of the separator in a row.
    parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
    # Remove leading/trailing separator.
    parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/, '')
    end
    parameterized_string.downcase
end