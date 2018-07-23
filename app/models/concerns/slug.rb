module Slug
    module InstanceMethods
        def slug
            username.downcase.gsub(" ","-")
        end
    end
end