require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品が投稿できる場合' do
      it '画像と商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば投稿できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品が投稿できない場合' do
      it '画像が空だと投稿できない' do
        @product.image = nil
        @product.valid? 
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_titleが空だと投稿できない' do
        @product.product_title = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product title can't be blank")
      end
      it 'product_titleが40文字以上だと投稿できない' do
        @product.product_title = "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product title is too long (maximum is 40 characters)")
      end
      it 'product_conceptが空だと投稿できない' do
        @product.product_concept = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product concept can't be blank")
      end
      it 'product_conceptが1000文字以上だと投稿できない' do
        @product.product_concept = "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product concept is too long (maximum is 1000 characters)")
      end
      it 'product_category_idが空だと投稿できない' do
        @product.product_category_id = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product category can't be blank")
      end
      it 'product_category_idが1だと投稿できない' do
        @product.product_category_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product category can't be blank")
      end
      it 'product_situation_idが空だと投稿できない' do
        @product.product_situation_id = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product situation can't be blank")
      end
      it 'product_situation_idが1だと投稿できない' do
        @product.product_situation_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product situation can't be blank")
      end
      it 'send_load_idが空だと投稿できない' do
        @product.send_load_id = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send load can't be blank")
      end
      it 'send_load_idが1だと投稿できない' do
        @product.send_load_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send load can't be blank")
      end
      it 'send_source_area_idが空だと投稿できない' do
        @product.send_source_area_id = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send source area can't be blank")
      end
      it 'send_source_area_idが1だと投稿できない' do
        @product.send_source_area_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send source area can't be blank")
      end
      it 'send_day_idが空だと投稿できない' do
        @product.send_day_id = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send day can't be blank")
      end
      it 'send_day_idが1だと投稿できない' do
        @product.send_day_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Send day can't be blank")
      end
      it 'product_priceが空だと投稿できない' do
        @product.product_price = " "
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product price can't be blank", "Product price is not a number", "Product price is invalid")
      end
      it 'product_priceが300円以下だと投稿できない' do
        @product.product_price = 200
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product price must be greater than or equal to 300")
      end
      it 'product_priceが9999999円以下だと投稿できない' do
        @product.product_price = 10000000
        @product.valid? 
        expect(@product.errors.full_messages).to include("Product price must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと投稿できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end      
  end
end
