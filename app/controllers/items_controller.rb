class ItemsController < ApplicationController

    get '/items' do
        if logged_in?
            @user = current_user
            @categories = ['Fats and Oils', 'Meat', 'Fish', 'Beans', 'Nuts', 'Dairy', 'Grains', 'Vegetables', 'Fruits']
            @items = Item.all
            erb :'/items/index'
        else
            redirect to "/login"
        end
    end

    get '/items/:category' do
        @category = params[:category]
        @items = Item.all.select {|i| i[:category].downcase.gsub(" ","-") == @category}
        erb :'/items/show'
    end
end
