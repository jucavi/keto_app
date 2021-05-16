class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, dependent: :destroy
  has_one_attached :avatar

  def user_name
    self.email.split('@')[0]
  end
end
