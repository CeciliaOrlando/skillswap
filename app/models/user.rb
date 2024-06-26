class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses # usuario dueño de cursos (teacher)
  has_many :events
  has_many :purchases
  has_many :courses_as_student, through: :purchases, source: :course # usuario comprador de cursos (estudiante)
end
