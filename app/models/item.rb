class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :plan
  belongs_to_active_hash :prefecture_code


  belongs_to :user
  has_many :messages
  has_one :order
  has_one_attached :image

  with_options presence: { message: '不正な値が入っています' } do
   validates :image
   validates :title
   validates :description
  end


  with_options numericality: { other_than: 1, message: '不正な値が入っています'} do
   validates :status_id
   validates :category_id
   validates :cost_id
   validates :prefecture_code_id
   validates :plan_id
  end
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
   validates :price, numericality:{only_integer: true, greater_than: 300, less_than: 9999999 }
  end
  validates :price, presence: true
end
