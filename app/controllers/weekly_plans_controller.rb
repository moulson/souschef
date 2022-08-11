class WeeklyPlansController < ApplicationController
  before_action :set_weekly_plan, only: %i[show edit update destroy]

  # GET /weekly_plans or /weekly_plans.json
  def index
    @weekly_plans = WeeklyPlan.all
  end

  # GET /weekly_plans/1 or /weekly_plans/1.json
  def show
    @ingredients = []
    @combined = []
    @weekly_plan.meals.each do | meal |
      meal.recipe.recipe_ingredients.each do | ingredient |
        ingredient.quantity = ingredient.quantity / (meal.recipe.serves / meal.people)
        @ingredients.push(ingredient)
      end
    end

    @ingredients.each do |ingredient|
      if @combined.select {|x| x.ingredient_id == ingredient.ingredient_id}.any?
        @combined.select {|x| x.ingredient_id == ingredient.ingredient_id}.first.quantity += ingredient.quantity
      else
        @combined.push(ingredient)
      end
    end
  end

  # GET /weekly_plans/new
  def new
    @weekly_plan = WeeklyPlan.new
    @recipes = Recipe.all
    @weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  end

  # GET /weekly_plans/1/edit
  def edit
    @recipes = Recipe.all
    @weekdays = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  end

  # POST /weekly_plans or /weekly_plans.json
  def create
    @weekly_plan = WeeklyPlan.new(weekly_plan_params)
    respond_to do |format|
      if @weekly_plan.save
        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_monday])
        meal.people = params[:weekly_plan][:breakfast_people_monday]
        meal.date = 0
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_monday])
        meal.people = params[:weekly_plan][:lunch_people_monday]
        meal.date = 0
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_monday])
        meal.people = params[:weekly_plan][:dinner_people_monday]
        meal.date = 0
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_tuesday])
        meal.people = params[:weekly_plan][:breakfast_people_tuesday]
        meal.date = 1
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_tuesday])
        meal.people = params[:weekly_plan][:lunch_people_tuesday]
        meal.date = 1
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_tuesday])
        meal.people = params[:weekly_plan][:dinner_people_tuesday]
        meal.date = 1
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_wednesday])
        meal.people = params[:weekly_plan][:breakfast_people_wednesday]
        meal.date = 2
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_wednesday])
        meal.people = params[:weekly_plan][:lunch_people_wednesday]
        meal.date = 2
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_wednesday])
        meal.people = params[:weekly_plan][:dinner_people_wednesday]
        meal.date = 2
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_thursday])
        meal.people = params[:weekly_plan][:breakfast_people_thursday]
        meal.date = 3
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_thursday])
        meal.people = params[:weekly_plan][:lunch_people_thursday]
        meal.date = 3
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_thursday])
        meal.people = params[:weekly_plan][:dinner_people_thursday]
        meal.date = 3
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_friday])
        meal.people = params[:weekly_plan][:breakfast_people_friday]
        meal.date = 4
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_friday])
        meal.people = params[:weekly_plan][:lunch_people_friday]
        meal.date = 4
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_friday])
        meal.people = params[:weekly_plan][:dinner_people_friday]
        meal.date = 4
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_saturday])
        meal.people = params[:weekly_plan][:breakfast_people_saturday]
        meal.date = 5
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_saturday])
        meal.people = params[:weekly_plan][:lunch_people_saturday]
        meal.date = 5
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_saturday])
        meal.people = params[:weekly_plan][:dinner_people_saturday]
        meal.date = 5
        meal.meal_type = 2
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:breakfast_recipe_sunday])
        meal.people = params[:weekly_plan][:breakfast_people_sunday]
        meal.date = 6
        meal.meal_type = 0
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:lunch_recipe_sunday])
        meal.people = params[:weekly_plan][:lunch_people_sunday]
        meal.date = 6
        meal.meal_type = 1
        meal.save

        meal = @weekly_plan.meals.create
        meal.recipe = Recipe.find(params[:dinner_recipe_sunday])
        meal.people = params[:weekly_plan][:dinner_people_sunday]
        meal.date = 6
        meal.meal_type = 2
        meal.save

        format.html { redirect_to weekly_plan_url(@weekly_plan), notice: 'Weekly plan was successfully created.' }
        format.json { render :show, status: :created, location: @weekly_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weekly_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_plans/1 or /weekly_plans/1.json
  def update
    respond_to do |format|
      if @weekly_plan.update(weekly_plan_params)
        format.html { redirect_to weekly_plan_url(@weekly_plan), notice: 'Weekly plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekly_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weekly_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_plans/1 or /weekly_plans/1.json
  def destroy
    @weekly_plan.destroy

    respond_to do |format|
      format.html { redirect_to weekly_plans_url, notice: 'Weekly plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weekly_plan
    @weekly_plan = WeeklyPlan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weekly_plan_params
    params.require(:weekly_plan).permit(:start_date)
  end
end
