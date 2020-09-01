FactoryBot.define do
  factory :buyer_address do
    postalcoad     { '123-4567' }
    prefecture_id  { 2 }
    city           { '横浜市緑区' }
    house_number   { '青山1-1-1' }
    building       { '柳ビル103' }
    phone          { '09012345678' }
    token          { 'asdfghjkl'}
  end
end
