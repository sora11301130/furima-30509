require 'rails_helper'

RSpec.describe Item, type: :module do
  before do
    @item = FactoryBot.build(:item)
  end
    describe "商品出品機能" do
      context "商品出品できるとき" do
        it "画像とtitle,description,status,category,cost,prefecture_code,plan,priceが存在している時保存できる" do
          expect(@item).to be_valid
        end
      end

      context "商品出品できないとき" do
        it "商品画像がない場合" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "titleがない場合出品できない" do
          @item.title = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it "商品説明がない場合出品できないこと" do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it "カテゴリーの情報がない場合出品できないこと" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "商品の状態について情報がない場合出品できないこと" do
          @item.status_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it "配送料の負担についての情報がない場合出品できない" do
          @item.cost_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be other than 1")
        end

        it "発送元の地域についての情報がない場合出品できない" do
          @item.prefecture_code_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture code must be other than 1")
        end

        it "発送までの日数についての情報がない場合出品できない" do
          @item.plan_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Plan must be other than 1")
        end

        it "価格についての情報がない場合出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price 半角数字を使用してください", "Price is not a number")
        end

        it "価格の範囲が300~9999999でない場合出品できない" do
          @item.price = "100"
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price must be greater than 300")
        end

        it "販売価格は半角数字でない場合出品できない" do
          @item.price = "４５６"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

      end
    end
  

end