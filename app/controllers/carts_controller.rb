class CartsController < ApplicationController

    get '/carts' do
        if logged_in?
            @carts = Cart.all.select {|cart| cart.user_id == @user.id}
            @user = current_user
            erb :'/carts/index'
        else
            redirect to "/login"
        end
    end

    get '/carts/:id' do
        if logged_in?
            @cart = Cart.find_by_id(params[:id])
            @sum = @cart.map {|i| i[:price]}.sum
            erb :'/carts/show'
        else
            redirect to "/login"
        end
    end

    # post '/' do
    #     @user = current_user
    #     @item = Item.all.find {|i| i[:name] == params[:item_name]}
    #     @user.items << @item
    #     redirect to "/users/#{@user.username}"
    # end

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

    delete '/carts/delete-item' do
        if logged_in?
            @item = Item.find_by_id(params[:item_id])
            @cart = Cart.find_by_id(params[:cart_id])
            @cart.delete(@item)      
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    delete '/carts/delete-cart' do
        if logged_in?
            @cart = Cart.find_by_id(params[:cart_id])
            if @cart && @cart.user == current_user
                @cart.delete
            end
            redirect to "/users/#{@cart.user.username}"
        else
            redirect to "/login"
        end
    end
            


end
