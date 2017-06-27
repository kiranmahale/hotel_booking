class Room < ApplicationRecord
  belongs_to :roomcategory
  has_many :reservations
  has_one :user, through: :reservations
end
