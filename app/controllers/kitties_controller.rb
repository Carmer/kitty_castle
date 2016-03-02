class KittiesController < ApplicationController

  def index
    @kitties = Kitty.all
  end

  def show
    @kitty = Kitty.find(params[:id])
  end

  def new
    @kitty = Kitty.new
  end

  def edit
    @kitty = Kitty.find(params[:id])
  end

  def create
    @kitty = Kitty.new(kitty_params)

    if @kitty.save
      flash[:message] = "YAYUH!!! New Kitty! Welcome #{@kitty.name} to the hoard."
      redirect_to kitties_path
    else
      flash.now[:error] = "NOO! Something when wrong with that Kitty. Please try again."
      render :new
    end
  end

  def update
    @kitty = Kitty.find(params[:id])

    if @kitty.update_attributes(kitty_params)
      flash[:message] = "#{@kitty.name} was updated."
      redirect_to kitties_path
    else
      flash.now[:error] = "NOO! Something when wrong with that Kitty. Please try again."
      render :new
    end
  end

  private

  def kitty_params
    params.require(:kitty).permit(:name, :age, :lives, :email)
  end
end
