class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # belongs_to :category
  attr_accessor :category_id

  def self.is_reserved(room_id, date_in,date_out)
  	start_date = DateTime.parse(date_in)
  	end_date = DateTime.parse(date_out)
  	reservation = Reservation.where('date_in BETWEEN ? AND ?', start_date.beginning_of_day, end_date.end_of_day).where(:room_id => room_id,)
  	if reservation
  		return true
  	else
  		return false
  	end
  end
end
