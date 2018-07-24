class CartsController < ApplicationController

    get '/carts' do
        if logged_in?
            @carts = Cart.all.select {|cart| cart.user == @user}
            @user = current_user
            erb :'/carts/index'
        else
            redirect to "/login"
        end
    end

    get '/carts/:id' do
        if logged_in?
            @cart = Cart.find_by_id(params[:id])

            @sum = @cart.items.map {|i| i[:price]}.sum
            erb :'/carts/show'
        else
            redirect to "/login"
        end
    end

    post '/carts' do
        if logged_in?
            if !params[:new_cart].empty?
                @cart = Cart.create(params[:cart_name])
                @cart.user = current_user
            else
                @cart = Cart.find(params[:cart_name])
            end
            @cart.item_ids << params[:items]
            @cart.save
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    patch '/carts/:id' do
        if logged_in?
            if params[:cart_name] != ""
                @cart = Cart.find_by(params[:cart_id])
                @cart.name = params[:cart_name]
                @cart.save
            else
                redirect to "/carts/#{@cart.id}"
            end
        else
            redirect to "/login"
        end
    end

    delete '/carts/:id/delete-item' do
        if logged_in?
            @item = Item.find_by_id(params[:item_id])
            @cart = Cart.find_by_id(params[:cart_id])
            @cart.delete(@item)      
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    delete '/carts/:id/delete-cart' do
        if logged_in?
            @cart = Cart.find_by_id(params[:id])
            if @cart && @cart.user == current_user
                @cart.delete
            end
            redirect to "/carts"
        else
            redirect to "/login"
        end
    end
end
