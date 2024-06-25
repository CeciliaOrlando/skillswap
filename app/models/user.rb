class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses # usuario comprador
  has_many :events
  has_many :purchases
  has_many :courses, through: :purchases # usuario vendedor de cursos
  has_one_attached :photo
end
