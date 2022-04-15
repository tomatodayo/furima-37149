class ProductsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]


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
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
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
    redirect_to root_path unless @product.buy == nil
  end
  
end
