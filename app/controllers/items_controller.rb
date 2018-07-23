class ItemsController < ApplicationController

    get '/items' do
        if logged_in?
            @user = current_user
            @items = @user.items
            erb :'/items/index'
        else
            redirect to "/login"
        end
    end

end
