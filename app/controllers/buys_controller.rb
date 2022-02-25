class BuysController < ApplicationController

  def index
    @buy_send = BuyAddress.new
    @product = Product.find(params[:product_id]) 
  end

  def create
    @product = Product.find(params[:product_id])
    @buy_send = BuyAddress.new(buy_params)
    if @buy_send.valid?
      @buy_send.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

end
