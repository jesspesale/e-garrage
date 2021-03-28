
require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "application_secret"
  end

  get "/" do
    erb :welcome
  end

    
  helpers do     # all methods defined in helpers is accesable 
                  # to the views and controllers of the app
    
    def logged_in?  #using return value of current user to return a true or false value
      !!current_user  
    end

    def current_user  #if sess-id exists- find user & set @user
      @user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end #if @user exists OR
        

    def authentication_required
      If !logged_in?
        flash[:message] = "You must be logged in."
        redirect '/'
    end
    
  end

end
