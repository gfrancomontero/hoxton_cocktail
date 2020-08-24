class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(strong_params)
    @dose.cocktail_id = params[:cocktail_id]
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
