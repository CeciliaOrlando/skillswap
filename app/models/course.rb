class Course < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_courses,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
