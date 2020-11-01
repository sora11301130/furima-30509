require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @order_destination = FactoryBot.build(:order_destination)
  end
  describe '購入情報の保存' do
    context '購入情報の保存ができるとき' do

     it 'すべての値が正しく入力されていれば保存できること' do
       expect(@order_destination).to be_valid
     end

    end

    context '購入情報の保存ができないとき' do

     it '郵便番号が空の場合保存できないこと' do
       @order_destination.post_code = ''
       @order_destination.valid?
       expect(@order_destination.errors.full_messages).to include("Post code can't be blank", "Post code 不正な値が入っています")
     end

     it '都道府県の情報が空の場合保存できないこと' do
      @order_destination.prefecture_code_id = ""
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture code 不正な値が入っています")
     end

     it '市町村の情報が空の場合保存できないこと' do
      @order_destination.city = ""
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
     end

     it '番地の情報が空の場合保存できないこと' do
      @order_destination.house_number = ""
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("House number can't be blank")
     end

     it '電話番号の情報が空の場合保存できないこと' do
      @order_destination.phone_number = ""
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number 不正な値が入っています")
     end

     it '郵便番号にハイフンが存在しない場合保存できないこと' do
      @order_destination.post_code = "1234567"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Post code 不正な値が入っています")
     end

     it '電話番号が11桁以上の場合保存できないこと' do
      @order_destination.phone_number = "111111111111"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number 不正な値が入っています")
     end

     it '電話番号が10桁未満の場合保存できないこと' do
      @order_destination.phone_number = "111111111"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number 不正な値が入っています")
     end

    end
  end


end
