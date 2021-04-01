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
    
    # Create
    get '/recipes/new' do
        erb :'/recipes/new'
    end

    # Read
    get '/recipes/:id' do
        if logged_in?
            @recipe = current_user.recipes.find(params[:id])
            @ingredients = @recipe.ingredients.split("\r\n")
            @instructions = @recipe.instructions.split("\r\n")
            erb :"recipes/show"
        else
            redirect "/users/login"
        end
    end

    post '/recipes' do
        # binding.pry
        # params[:ingredients].split("\r\n").join(",")
        if params[:recipe_name] == "" || params[:ingredients] == "" || params[:instructions] == "" 
            flash[:message] = "Please make sure you fill out all fields."
            redirect "/recipes/new"
        else        
        
        @recipe = Recipe.new
        @recipe.recipe_name = params[:recipe_name]
        @recipe.ingredients = params[:ingredients]
        @recipe.instructions = params[:instructions]
        @recipe.cooktime = params[:cook_time]
        @recipe.user = current_user
        end
        if @recipe.save
            redirect "/recipes/#{@recipe.id}"
        else
            erb :'/recipes/new'
        end
    end

    # Update
    get '/recipes/:id/edit' do 
        if logged_in?
            @recipe = Recipe.find_by_id(params[:id])
            # binding.pry
            if @recipe && @recipe.user == current_user
                erb :'/recipes/edit'
            else
                redirect to '/recipes'
            end
        else
            redirect to '/users/login'
        end
    end

    patch '/recipes/:id' do
        if logged_in?
            @recipe = Recipe.find(params[:id])
               @recipe.update(
                #    params[:recipe])
                        recipe_name: params[:recipe_name],
                        ingredients: params[:ingredients],
                        instructions: params[:instructions],
                        cooktime: params[:cooktime] 
                        )
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "/recipes/:id/edit"
        end
    end

    # Delete / Destroy
    delete '/recipes/:id' do 
        @recipe = Recipe.find(params[:id])
        @recipe.destroy

        redirect '/recipes'
    end

end