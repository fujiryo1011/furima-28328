require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき'

    it '画像、商品名、コメント、など一連の情報の記載が必須である事' do
      expect(@item).to be_valid
    end
    it '価格の範囲が¥300~¥9,999,999の間である事' do
      @item.price = '400'
      @item.valid?
      expect(@item).to be_valid
    end

    context '商品の出品がうまくいかないとき'
    it '画像が1枚も添付されていない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'コメントが空だと登録できない' do
      @item.comment = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end
    it 'カテゴリーが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーが「--」だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態が空だと登録できない' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '商品の状態が「--」だと登録できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State Select')
    end
    it '配送料の負担が空だと登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it '配送料の負担が「--」だと登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end
    it '発送元の地域が空だと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送元の地域が「--」だと登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '発送までの日数が空だと登録できない' do
      @item.until_shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Until shipping can't be blank")
    end
    it '発送までの日数が「--」だと登録できない' do
      @item.until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Until shipping Select')
    end
    it '価格が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が¥300~¥9,999.999の間ではない' do
      @item.price = '250'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が¥300~¥9,999.999の間ではない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
