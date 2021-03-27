class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]

        if @user.save
            redirect '/'
        else
            erb :'/users/signup'
        end
    end

end