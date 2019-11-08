class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_permit)
    if @cocktail.save
    redirect_to cocktail_path(@cocktail)
  else render 'new'
  end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_permit
    params.require("cocktail").permit(:name)
  end
end
