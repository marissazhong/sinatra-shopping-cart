require 'rack-flash'

class CartsController < ApplicationController
    use Rack::Flash

    # shows all user's carts
    get '/carts' do
        if logged_in?
            @user = current_user
            @carts = Cart.where(user_id: @user.id).all
            erb :'/carts/index'
        else
            redirect to "/login"
        end
    end

    # shows content of selected cart
    get '/carts/:id' do
        if logged_in?
            @user = current_user
            @cart = Cart.find_by_id(params[:id])
            if @cart && @cart.user == @user
                @sum = @cart.items.map {|i| i[:price]}.sum
                erb :'/carts/show'
            else
                redirect to "/carts"
            end
        else
            redirect to "/login"
        end
    end

    # finds or creates cart, and adds items
    post '/carts' do
        if logged_in?
            if !params[:new_cart].empty?
                @existing_cart = Cart.find_by(name: params[:new_cart])
                if !@existing_cart
                    @cart = Cart.create(name: params[:new_cart])
                    current_user.carts << @cart
                elsif @existing_cart && @existing_cart.user == current_user
                    @cart = @existing_cart
                elsif @existing_cart && @existing_cart.user != current_user
                    flash[:message] = "Shopping cart is taken. Please choose a different shopping cart name."
                    redirect to "/carts"
                end
            elsif params[:new_cart].empty? && params[:cart_name] == "new_cart"
                flash[:message] = "Shopping cart must have a name. Please try again."
                redirect to "/carts"
            else
                @cart = Cart.find_by(name: params[:cart_name])
            end
            if params[:item_list] != ""
                params[:item_list].each do |item|
                    @cart.items << Item.where(name: item)
                end
                @cart.save
            end
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    # updates cart name
    patch '/carts/:id' do
        if logged_in?
            if params[:cart_name] != ""
                @cart = Cart.find(params[:id])
                @cart.update(name: params[:cart_name])
            end
            redirect to "/carts/#{@cart.id}"
        else
            redirect to "/login"
        end
    end

    # deletes item from single cart
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

    # deletes entire cart
    delete '/carts/:id/delete-cart' do
        @cart = Cart.find_by_id(params[:id])
        if logged_in?  && @cart.user == current_user
            @cart.delete
        else
            flash[:message] = "Shopping cart invalid. Please try again."
        end
            redirect to "/carts"
    end
end
