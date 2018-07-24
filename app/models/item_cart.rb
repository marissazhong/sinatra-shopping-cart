class ItemCart < ActiveRecord::Base
    belongs_to :item
    belongs_to :cart
end