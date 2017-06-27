class User < ApplicationRecord
	has_many :reservations
	has_many :rooms, through: :reservations


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
	                  format: {with: VALID_EMAIL_REGEX},
	                  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	before_save :downcase_email
	
	def rooms
		Room.includes(:reservations).where(:reservations => {:user_id => self.id} )
	end

	def booked_rooms
		Room.includes(:reservations).where(:rooms => {:is_booked => true},:reservations => {:user_id => self.id} )
	end

  private
    def downcase_email
      self.email = email.downcase
    end
end
