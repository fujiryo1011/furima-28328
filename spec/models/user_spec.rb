require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが必須であること" do
    end
    it "emailが必須であること" do
    end
    it "emailが一意性であること" do
    end
    it "emailは＠を含む必要があること" do
    end
    it "passwordが必須であること" do
    end
    it "passwordは６文字以上であること" do
    end
    it "passwordは半角英数字混合であること" do
    end
    it "passwordは確認用を含めて2回入力すること" do
    end
    it "本名は名字と名前が必須であること" do
    end
    it "本名は全角(漢字・ひらがな・カタカナ)で入力させること" do
    end
    it "本名のフリガナが名字と名前で必須であること" do
    end
    it "本名のフリガナが全角(カタカナ)で入力させること" do
    end
    it "生年月日が必須であること" do
    end
  end
end