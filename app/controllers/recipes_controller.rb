class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource except: [:index]
  # skip_authorize_resource :only => :new

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
       redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
       render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
       redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
       render :edit
    end
  end

  def destroy
    @recipe.destroy

    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :content).merge(user_id: current_user.id)
    end
end
