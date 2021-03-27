class RecipesController < ApplicationController


    get '/recipes' do
        if logged_in?
            @recipes = current_user.recipes
            erb :'recipes/index'
        else
            erb :'/layout'
        end
    end


end