class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :incidents

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, uniqueness: true
end
