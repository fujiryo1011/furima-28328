FactoryBot.define do
  factory :item do
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/staff3.jpg')) }
    name               { 'Tシャツ 新品 1枚' }
    comment            { 'こちらの商品は新品のTシャツ1枚になります。' }
    category_id        { 2 }
    state_id           { 2 }
    shipping_fee_id    { 2 }
    prefecture_id      { 2 }
    until_shipping_id  { 2 }
    price              { '3000' }
  end
end
