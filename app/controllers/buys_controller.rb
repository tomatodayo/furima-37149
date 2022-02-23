class BuysController < ApplicationController

  def index
    @buy_send = BuySend.new
  end

  def create
    @buy_send = BuySend.new(buy_params)
    if @buy_send.valid?
      @buy_send.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def donation_params
    params.require(:buy_send).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number, :product_price).merge(user_id: current_user.id, product_id: current_product.id)
  end


end
