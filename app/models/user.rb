class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は、不正な値です。' 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
   validates :first_name, presence: true
   validates :family_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
   validates :reading_first_name, presence: true
   validates :reading_family_name, presence: true
  end
  
  validates :birthday, presence: true


  has_many :items
  has_many :comments
  has_many :orders
end
