require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it "nicknameとemail, password, family_name, first_name, reading_first_name, reading_family_name, birthdayの入力が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end

      it "reading_first_nameが全角カタカナだと登録できる" do
        @user.reading_first_name = "タロウ"
        expect(@user).to be_valid
      end

      it "reading_family_nameが全角カタカナだと登録できる" do
        @user.reading_family_name = "タナカ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "重複したメールアドレスが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが半角英数字5文字以下であれば登録できない" do
        @user.password = "qwe12"
        @user.password_confirmation = "qwe12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password は、不正な値です。")
      end

      it "passwordが数字のみの場合登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、不正な値です。")
      end

      it "passwordが英字のみの場合登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、不正な値です。")
      end

      it "passwordとpassword_confirmationの値が一致しなければ登録できない" do
        @user.password = "aaa123"
        @user.password_confirmation = "aaa1123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@を含んでいない場合登録できない" do
        @user.email = "kikikikigmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "family_nameが全角ではない場合登録できない" do
        @user.family_name = "huhu"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角ではない場合登録できない" do
        @user.first_name = "huhuhu"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it "reading_family_nameが空だと登録できない" do
        @user.reading_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading family name can't be blank")
      end

      it "reading_family_nameが全角ではない場合登録できない" do
        @user.reading_family_name = "huhuhu"
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading family name 全角カタカナを使用してください")
      end

      it "reading_family_nameが存在してもreading_first_nameが空だと登録できない" do
        @user.reading_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name can't be blank")
      end

      it "reading_first_nameが全角ではない場合登録できない" do
        @user.reading_first_name = "huhuhu"
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name 全角カタカナを使用してください")
      end

      it "生年月日が空の場合登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

 



    end
 end
end