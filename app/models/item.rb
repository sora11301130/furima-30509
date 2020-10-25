class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :plan
  belongs_to_active_hash :prefecture_code


  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :status_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :prefecture_code_id, numericality: { other_than: 1 }
  validates :plan_id, numericality: { other_than: 1 }
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
   validates :price, numericality:{only_integer: true, greater_than: 300, less_than: 9999999 }
  end
  validates :description, presence:true
end
