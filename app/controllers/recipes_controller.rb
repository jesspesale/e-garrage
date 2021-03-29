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
        if logged_in?
            @recipe = current_user.recipes.find(params[:id])
            erb :"recipes/show"
        else
            redirect "/users/login"
        end
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

    get '/recipes/:id/edit' do 
        if logged_in?
            @recipe = Recipe.find_by_id(params[:id])
            if @recipe && @recipe.user == current_user
                erb :'/recipes/edit'
            else
                redirect to '/recipes'
            end
        else
            redirect to '/users/login'
        end
    end

    # patch '/recipes/:id' do
    #     if logged_in?
    #         if params[:recipe_name] == "" || params[:ingredients] == "" || params[:instructions] == "" || params[:cooktime] == ""
    #             redirect "/recipes/#{params[:id]}/edit"
    #         elsif
    #             @recipe = Recipe.find(params[:id])
    #             @recipe.update(
    #                     recipe_name: params[:recipe_name]
    #                     ingredients: params[:ingredients]
    #                     instructions: params[:instructions]
    #                     cooktime:      params[:cooktime]
    #             )
    #             redirect "/recipes/#{@recipe.id}"
    #             end
    #     else
    #         redirect "/recipes/:id/edit"
    #     end
    # end
    # end

end