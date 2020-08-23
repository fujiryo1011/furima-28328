require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき'
    it "nicknameが必須であること" do
      @user.nickname = "furima太郎"
      @user.valid?
      expect(@user).to be_valid
    end
    it "emailが必須であること" do
      @user.email = "oo@gmail.com"
      @user.valid?
      expect(@user).to be_valid
    end
    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(@user).to be_valid
    end
    it "emailは＠を含む必要があること" do
      @user.email = 'eeeg@mail.com'
      @user.valid?
      expect(@user).to be_valid
    end
    it "passwordが必須であること" do
      @user.password = "qwe123"
      @user.valid?
      expect(@user).to be_valid
    end
    it "passwordは６文字以上であること" do
      @user.password = "asd456"
      @user.valid?
      expect(@user).to be_valid
    end
    it "passwordは半角英数字混合であること" do
      @user.password = "qwe456"
      @user.valid?
      expect(@user).to be_valid
    end
    it "本名は名字と名前が必須であること" do
      @user.firstname = "太郎"
      @user.lastname = "田中"
      @user.valid?
      expect(@user).to be_valid
    end
    it "本名は全角(漢字・ひらがな・カタカナ)で入力させること" do
      @user.firstname = "太郎"
      @user.lastname = "田中"
      @user.valid?
      expect(@user).to be_valid
    end
    it "本名のフリガナが名字と名前で必須であること" do
      @user.first_name_kana = "タロウ"
      @user.lastname = "タナカ"
      @user.valid?
      expect(@user).to be_valid
    end
    it "本名のフリガナが全角(カタカナ)で入力させること" do
      @user.first_name_kana = "タロウ"
      @user.lastname = "タナカ"
      @user.valid?
      expect(@user).to be_valid
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    context '新規登録がうまくいかないとき'
    it "nicknameが空だと登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複していると登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに＠が含まれていないと登録できないこと" do
      @user.email = 'eeegmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でなければ登録できないこと" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが1度しか入力されていなければ登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "本名が空だと登録できないこと" do
      @user.firstname = ""
      @user.lastname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is invalid", "Lastname can't be blank", "Lastname is invalid")
    end
    it "本名に全角(漢字・ひらがな・カタカナ)が入力されていなければ登録できないこと" do
      @user.firstname = "aaa"
      @user.lastname = "bbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid", "Lastname is invalid")
    end
    it "本名のフリガナが空だと登録できないこと" do
      @user.first_name_kana = ""
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank","Last name kana can't be blank")
    end
    it "本名のフリガナが全角(カタカナ)で入力されていなければ登録できないこと" do
      @user.first_name_kana = "たろう"
      @user.last_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end
    it "生年月日が空だと登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end