require 'rack-flash'

class UsersController < ApplicationController
    use Rack::Flash

    # shows user welcome page after login
    get '/users/:username' do
        @user = User.find_by(username: params[:username])
        erb :'/users/show'
    end
    
    # shows signup form
    get '/signup' do
        if logged_in?
            redirect to "/items"
        else
            erb :'/users/create_user'
        end
    end
    
    # find or creates user
    post '/signup' do
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @existing_user = User.find_by(username: params[:username])
            if @existing_user
                flash[:message] = "Username is taken. Please choose a different username or login below."
                redirect to "/signup"
            else
                @user = User.create(username: params[:username], email: params[:email], password: params[:password])
                @user.save
                session[:user_id] = @user.id
                redirect to "/items"
            end
        else
            flash[:message] = "Account information invalid. Please try again."
            redirect to "/signup"
        end
    end
    
    # shows login page
    get '/login' do
        if logged_in?
            redirect to "/users/#{@user.username}"
        else
            erb :'/users/login'
        end
    end
    
    # logs in user
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.username}"
        else
            flash[:message] = "Login information invalid. Please try again."
            redirect to "/login"
        end
    end
    
    # logs out user
    get '/logout' do
        if logged_in?
            session.clear
        end
        redirect to "/"
    end
end
