class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        @user = User.new(name: params[:username], email: params[:email], password: params[:password])

        if @user.save
            session[:user_id] = @user.id
            redirect '/recipes'
        else
            redirect '/users/signup'
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/recipes'
        else
            flash[:message] = "Wrong username or password, please try again or sign up."
            erb :'/users/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end