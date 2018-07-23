module Slug
    module InstanceMethods
        def slug(name)
            name.downcase.gsub(" ","-")
        end
    end
end