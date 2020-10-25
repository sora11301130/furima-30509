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
          expect(@item.errors.full_messages).to include("Image 不正な値が入っています")
        end

        it "titleがない場合出品できない" do
          @item.title = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Title 不正な値が入っています")
        end

        it "商品説明がない場合出品できないこと" do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description 不正な値が入っています")
        end

        it "カテゴリーの情報がない場合出品できないこと" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category 不正な値が入っています")
        end

        it "商品の状態について情報がない場合出品できないこと" do
          @item.status_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Status 不正な値が入っています")
        end

        it "配送料の負担についての情報がない場合出品できない" do
          @item.cost_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost 不正な値が入っています")
        end

        it "発送元の地域についての情報がない場合出品できない" do
          @item.prefecture_code_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture code 不正な値が入っています")
        end

        it "発送までの日数についての情報がない場合出品できない" do
          @item.plan_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Plan 不正な値が入っています")
        end

        it "価格についての情報がない場合出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price 半角数字を使用してください", "Price is not a number")
        end

        it "価格の範囲が300以上でない場合出品できない" do
          @item.price = "100"
          @item.valid?
          expect(@item.errors.full_messages).to include ("Price must be greater than 300")
        end

        it "価格が9999999以下でない場合出品できない"  do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end

        it "販売価格は半角数字でない場合出品できない" do
          @item.price = "４５６"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

      end
    end
  

end