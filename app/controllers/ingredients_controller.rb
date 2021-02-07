class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:index, :show]
  # load_and_authorize_resource except: [:index]
  # skip_authorize_resource :only => :new

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
       redirect_to @ingredient, notice: 'Ingredient was successfully created.'
    else
       render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
       redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
       render :edit
    end
  end

  def destroy
    @ingredient.destroy

    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :description)
    end
end
