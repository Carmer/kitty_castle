class ReservationsController < ApplicationController
  def create
    credit_card = reservation_params[:credit_card_number]
    credit_card = credit_card.gsub(/-|\s/,'')
    reservation_params[:credit_card_number] = credit_card

    @order = Order.new(reservation_params)

    if @order.save
      flash[:notice] = "Order was created."
      ReservationMailer.order_confirmation(@order.user).deliver
      @order.user.update_attributes(status: “active”)
      redirect_to current_user
    else
      render :new
    end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:credit_card_number, :kitty_id, :castle_id )
  end
end
