class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy new_ingredient]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  # GET /recipes/1/edit
  def edit
    @ingredients = Ingredient.all
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_ingredient
    recipe_ingredient = @recipe.recipe_ingredients.create
    ingredient = Ingredient.find(params[:ingredient])
    recipe_ingredient.ingredient = ingredient
    recipe_ingredient.quantity = params[:recipe_ingredient][:quantity]

    respond_to do |format|
      if recipe_ingredient.save
        format.html { redirect_to edit_recipe_path(@recipe), notice: "Ingredient added" }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :method, :ingredients, :serves, :photo)
    end
end
