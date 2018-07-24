class CartsController < ApplicationController

    get '/carts' do
        if logged_in?
            @user = current_user
            @carts = Cart.where(user_id: @user.id).all
            erb :'/carts/index'
        else
            redirect to "/login"
        end
    end

    get '/carts/:id' do
        if logged_in?
            @user = current_user
            @cart = Cart.find_by_id(params[:id])
            if @cart && @cart.user == @user
                @sum = @cart.items.map {|i| i[:price]}.sum
                erb :'/carts/show'
            end
        else
            redirect to "/login"
        end
    end

    post '/carts' do
        if logged_in?
            if !params[:new_cart].empty?
                @cart = Cart.create(name: params[:new_cart])
                @cart.user_id = current_user.id
            else
                @cart = Cart.find(params[:cart_name])
            end
            if params[:item_list] != ""
                params[:item_list].each do |item|
                    @cart.items << Item.find_by_id(item)
                end
            end
            @cart.save
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    patch '/carts/:id' do
        if logged_in?
            if params[:cart_name] != ""
                @cart = Cart.find_by(params[:id])
                if @cart && @cart.user == current_user
                    @cart.name = params[:cart_name]
                    @cart.save
                end
            end
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    delete '/carts/:id/delete-item' do
        if logged_in?
            @item = Item.find_by_id(params[:item_id])
            @cart = Cart.find_by_id(params[:id])
            @cart.items.delete(@item)    
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
