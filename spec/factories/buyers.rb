FactoryBot.define do
  factory :buyer do
    user_id   { 2 }
    item_id   { 3 }
    # association :user,:item
  end
end
