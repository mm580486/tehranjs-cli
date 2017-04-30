module Tehranjs
    module Web
        module Filter
            def before_filter name
                @@filter = name
            end

            def method_added name
                return if @filtering # Don't add filters to original_ methods
                return if @@filter == name # Don't filter filters
                return if name == :initialize

                @filtering = true

                alias_method :"original_#{name}", name
                define_method name do |*args|
                self.send @@filter, name
                self.send :"original_#{name}", *args
                end
                @filtering = false
            end
        end
    end
end