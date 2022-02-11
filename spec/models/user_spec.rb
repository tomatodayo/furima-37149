require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation,first_nameとlast_name,kana_first_nameとkana_last_name,birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = "1234aaaa"
        @user.password_confirmation = "1234aaaa"
        expect(@user).to be_valid
      end
      it 'passwordが英字と数字が含んであれば登録できる' do
        @user.password = "1234aa"
        @user.password_confirmation = "1234aa"
        expect(@user).to be_valid
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる'do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる'do
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it 'kana_first_nameが全角(カタカナ)であれば登録できる'do
        @user.kana_first_name = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'kana_last_nameが全角(カタカナ)であれば登録できる'do
        @user.kana_last_name = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字だけであれば登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字だけであれば登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないと場合は登録できない' do
        @user.email = 'sample.sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが英語では登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが英語では登録できない" do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_first_nameが英語では登録できない" do
        @user.kana_first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      it "kana_last_nameが空では登録できない" do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it "kana_last_nameが英語では登録できない" do
        @user.kana_last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it "誕生日が空では登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end