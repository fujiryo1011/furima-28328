require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき'

    it "画像が1枚以上添付されている事" do
    end
    it "商品名が必須である事" do
      @item.name = "シャーペン 1本 中古"
      @item.valid?
      expect(@item).to be_valid
    end
    it "商品説明が必須である事" do
    end
    it "カテゴリーが必須である事" do
    end
    it "商品の状態についての情報が必須である事" do
    end
    it "配送料の負担についての情報が必須である事" do
    end
    it "発送元の地域についての情報が必須である事" do
    end
    it "発送までの日数についての情報が必須である事" do
    end
    it "価格についての情報が必須である事" do
    end
    it "価格の範囲が¥300~¥9,999,999の間である事" do
    end


    it "" do
    end
  end
end