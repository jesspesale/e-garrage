class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
            flash[:message] = "Please make sure you fill out all fields."
            redirect "/signup"
        else
            @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        end
        if @user.save
            session[:user_id] = @user.id
            redirect '/recipes'
        else
            redirect '/users/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect "/recipes"
        else
            erb :'users/login'
        end
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