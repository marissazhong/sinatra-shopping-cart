class UsersController < ApplicationController

    get '/users/:username' do
        @user = User.find_by(username: params[:username])
        erb :'/users/show'
    end

    post '/users/cart' do
        @user = current_user
        @item = Item.all.find {|i| i[:name] == params[:item_name]}
        @user.items << @item
        redirect to "/users/#{@user.username}"
    end
    
    get '/signup' do
        if logged_in?
            redirect to "/items"
        else
            erb :'/users/create_user'
        end
    end
    
    post '/signup' do
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @user = User.create(username: params[:username], email: params[:email], password: params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to "/items"
        else
            redirect to "/signup"
        end
    end
    
    get '/login' do
        if logged_in?
            redirect to "/items"
        else
            erb :'/users/login'
        end
    end
    
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/items"
        else
            redirect to "/signup"
        end
    end
    
    get '/logout' do
        if logged_in?
            session.clear
            redirect to "/login"
        else
            redirect to "/"
        end
    end
    
       

end
