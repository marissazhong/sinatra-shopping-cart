class AddTypeChangePriceTypeToItems < ActiveRecord::Migration
    def change
        add_column :items, :type, :string
        change_column :items, :price, :decimal
    end
end