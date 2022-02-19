class ProductsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]


  def index
    @products = Product.order("created_at DESC")
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

  def show
  end

  def edit
  #(「自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること。」は商品購入機能の時に実装する)
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:product_title, :product_concept, :product_category_id, :product_situation_id, :send_load_id, :send_source_area_id, :send_day_id, :product_price, :image ).merge(user_id: current_user.id)
  end

  def set_prototype
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @product.user
  end
  
end
