require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入画面の実装' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, product_id: product.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
        sleep 0.1
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
        sleep 0.1
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
        sleep 0.1
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.post_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid")
        sleep 0.1
      end
      it 'phone_numberが全角だと保存できないこと' do
        @buy_address.phone_number = "１２３－４５６７"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
        sleep 0.1
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture must be other than 1")
        sleep 0.1
      end
      it 'cityを選択していないと保存できないこと' do
        @buy_address.city = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
        sleep 0.1
      end
      it 'blockを選択していないと保存できないこと' do
        @buy_address.block = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Block can't be blank")
        sleep 0.1
      end
      it 'phone_numberを選択していないと保存できないこと' do
        @buy_address.phone_number = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        sleep 0.1
      end
      it 'phone_numberが全角だと保存できないこと' do
        @buy_address.phone_number = "１２３４５６７８９０９"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
        sleep 0.1
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
        sleep 0.1
      end
      it 'product_idが紐付いていないと保存できないこと' do
        @buy_address.product_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Product can't be blank")
        sleep 0.1
      end
    end
  end
end
