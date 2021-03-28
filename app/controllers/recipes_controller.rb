class RecipesController < ApplicationController
    before '/recipes/*' do
        authentication_required
    end

    get '/recipes' do
        if logged_in? #bc a user has many recipes we have .recipes
            @recipes = current_user.recipes 
            erb :'recipes/index'
        else
            erb :'/layout'
        end
    end
    
    get '/recipes/new' do
        erb :'/recipes/new'
    end

    get '/recipes/:id' do
        # binding.pry
        @recipe = current_user.recipes.find(params[:id])
        
        # binding.pry
        erb :"recipes/show"
    end

    post '/recipes' do
        @recipe = Recipe.new
        @recipe.recipe_name = params[:recipe_name]
        @recipe.ingredients = params[:ingredients]
        @recipe.instructions = params[:instructions]
        @recipe.cooktime = params[:cook_time]
        @recipe.user = current_user

        if @recipe.save
            redirect '/recipes'
        else
            erb :'/recipes/new'
        end
    end


end