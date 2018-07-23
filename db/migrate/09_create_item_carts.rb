class CreateItemCarts < ActiveRecord::Migration
    def change 
      create_table :item_carts do |t|
        t.integer :cart_id
        t.integer :item_id
        t.timestamps null: false
      end
    end
  end