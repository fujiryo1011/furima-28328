FactoryBot.define do
  factory :item do
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/staff3.jpg')) }
    name               { 'Tシャツ 新品 1枚' }
    comment            { 'こちらの商品は新品のTシャツ1枚になります。' }
    category_id        { 'メンズ' }
    state_id           { '新品、未使用' }
    shipping_fee_id    { '送料込み(出品者負担)' }
    prefecture_id      { '東京都' }
    until_shipping_id  { '2~3日で発送' }
    price              { '3000' }
  end
end
