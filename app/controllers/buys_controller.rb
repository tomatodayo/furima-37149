class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buy_send = BuyAddress.new
    @product = Product.find(params[:product_id]) 
  end

  def create
    @product = Product.find(params[:product_id])
    @buy_send = BuyAddress.new(buy_params)
    if @buy_send.valid?
      pay_item
      @buy_send.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @product.product_price,
          card: buy_params[:token],    
          currency: 'jpy'                 
        )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    redirect_to root_path unless @product.buy == nil
    redirect_to root_path if current_user == @product.user
  end

end
