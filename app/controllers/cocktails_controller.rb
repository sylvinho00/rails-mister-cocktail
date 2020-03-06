class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @new_cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  # def new
  #   @cocktail = Cocktail.new
  # end

  def create
    @new_cocktail = Cocktail.new(cocktail_params)
    if @new_cocktail.save
      redirect_to cocktail_path(@new_cocktail), notice: "Cocktail '#{@new_cocktail.name}' as been added successfully"
    else
      @cocktails = Cocktail.all
      render :index
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
