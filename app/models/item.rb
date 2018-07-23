class Item < ActiveRecord::Base
    has_many :item_carts
    has_many :carts, through: :item_carts
    include Slug::InstanceMethods
end
