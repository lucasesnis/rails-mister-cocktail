class DosesController < ApplicationController

  def new
    @cocktail      = Cocktail.find(params[:cocktail_id])
    @dose          = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @cocktail      = Cocktail.find(params[:cocktail_id])
    @dose          = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find_by(cocktail_id: params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(
      :description,
      :ingredient_id,
      :cocktail_id
    )
  end
end
