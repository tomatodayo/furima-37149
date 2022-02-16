class ProductsController < ApplicationController

  def index

  end

  def new
    if user_signed_in? 
      @product = Product.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def product_params
    params.require(:product).permit(:product_title, :product_concept, :product_category_id, :product_situation_id, :send_load_id, :send_source_area_id, :send_day_id, :product_price, :image ).merge(user_id: current_user.id)
  end
  
end
