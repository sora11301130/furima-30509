class Order < ApplicationRecord
  # attr_accessor :exp_month, :exp_year, :number, :post_code, :prefecture_code_id, :city, :house_number, :build_number, :phone_number, :price
  belongs_to :item
  belongs_to :user
  


end
