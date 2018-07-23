class ItemsController < ApplicationController

    get '/items' do
        if logged_in?
            @user = current_user
            @items = Item.all
            erb :'/items/index'
        else
            redirect to "/login"
        end
    end

    get '/items/:category' do
        @category = params[:category]
        @items = Item.all.select {|i| i[:category] == @category}
        erb :'/items/show'
    end
end
