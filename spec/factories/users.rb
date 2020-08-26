FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { 'aaa@gmail.com' }
    password              { 'asd123' }
    firstname             { '太郎' }
    lastname              { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birthday              { '2000/1/1' }
  end
end
