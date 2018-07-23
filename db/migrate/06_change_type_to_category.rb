class ChangeTypeToCategory < ActiveRecord::Migration
    def change
        remove_column :items, :type
        add_column :items, :category, :string
    end
end