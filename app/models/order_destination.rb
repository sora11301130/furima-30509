class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_code_id, :city, :house_number, :build_number, :phone_number, :token, :price


    validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: '不正な値が入っています' }

    with_options presence: true do
    validates :city
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
    validates :price
    end
   
  
    with_options presence: true, format: {with: /\A\d{10,11}\z/, message: '不正な値が入っています'} do
    validates :phone_number
    end
  
    with_options numericality:{ other_than: 1, message: '不正な値が入っています'} do
      validates :prefecture_code_id
    end
  
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      SendingDestination.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, build_number: build_number, phone_number: phone_number, order_id: order.id)
    end

  
end
