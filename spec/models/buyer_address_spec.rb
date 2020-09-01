require 'rails_helper'
RSpec.describe BuyerAddress, type: :model do
  before do
    @address = FactoryBot.build(:buyer_address)
  end

  describe '配送先情報入力' do
    context '配送先情報の入力がうまくいく時'

    it '郵便番号、都道府県、市区町村、番地、電話番号など一連の情報の記載が必須である事' do
      expect(@address).to be_valid
    end
    it '郵便番号にハイフンが含まれている事' do
      @address.postalcoad = '123-4567'
      @address.valid?
      expect(@address).to be_valid
    end
    it '電話番号にハイフンが無く11桁以内である事' do
      @address.phone = '09012345678'
      @address.valid?
      expect(@address).to be_valid
    end

    context '配送先情報の入力がうまくいかない時'

    it '郵便番号が空だと購入できない' do
      @address.postalcoad = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Postalcoad can't be blank")
    end
    it '都道府県が空だと購入できない' do
      @address.prefecture_id = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと購入できない' do
      @address.city = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できない' do
      @address.house_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @address.phone = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone can't be blank")
    end
    it '郵便番号にハイフンが含まれていないと購入できない' do
      @address.postalcoad = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include('Postalcoad is invalid')
    end
    it '電話番号にハイフンが含まれていて11桁以上であると購入できない' do
      @address.phone = '090-1234-567'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone is invalid')
    end
    it 'トークンが空だと購入できない' do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
