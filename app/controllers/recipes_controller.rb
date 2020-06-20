class RecipesController < ApplicationController
  def index
    @recipes = decorated_recipes
  end

  def show
    @recipe = decorated_recipe

    return not_found if @recipe.object.nil?

    set_recipe_meta_title
  end

  private

  def decorated_recipes
    RecipeDecorator.decorate_collection(recipes)
  end

  def decorated_recipe
    RecipeDecorator.decorate(recipe)
  end

  def recipes
    Recipe.all.load
  end

  def recipe
    Recipe.find(params[:id])
  end

  def set_recipe_meta_title
    set_meta_tags(title: @recipe.title)
  end
end
