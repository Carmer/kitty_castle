class SessionsController < ApplicationController

  def create
    @kitty = Kitty.find(params[:id])

    if @kitty && @kitty.authenticate(params[:session][:password])
      flash[:notice] = "Succsessfully Logged In As #{@kitty.name}"
      session[:kitty_id] = @kitty.id
      redirect_to kitty_path
    else
      flash[:error] = "Invalid Credentials. Please Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out meow."
    redirect_to root_path
  end

  def new
  end
end
