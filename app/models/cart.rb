class Cart < ActiveRecord::Base
    has_many :item_carts
    has_many :items, through: :item_carts
    include Slug::InstanceMethods
end