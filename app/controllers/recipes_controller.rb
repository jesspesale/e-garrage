class RecipesController < ApplicationController
    before '/recipes/*' do
        authentication_required
    end

    get '/recipes' do
        if logged_in?
            @recipes = current_user.recipes
            # @recipes = Recipe.find_by(user: current_user)
            erb :'recipes/index'
        else
            erb :'/layout'
        end
    end

    get '/recipes/new' do
        erb :'/recipes/new'
    end

    post '/recipes' do
        @recipe = Recipe.new
        @recipe.recipe_name = params[:recipe_name]
        @recipe.ingredients = params[:ingredients]
        @recipe.recipe = params[:recipe]
        @recipe.cooktime = params[:cook_time]
        @recipe.user = current_user
        binding.pry

        if @recipe.save
            redirect '/recipes'
        else
            erb :'/recipes/new'
        end
    end

    get '/recipe/:id' do
        "Hello recipe"
    end


end