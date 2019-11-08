class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_permit)
    # @dose.save
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end

    # redirect_to cocktail_path()
  end

  def destroy
    @dose = Dose.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def params_permit
    params.require("dose").permit(:description, :ingredient_id)
  end
end
