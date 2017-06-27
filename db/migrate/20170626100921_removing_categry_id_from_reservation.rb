class RemovingCategryIdFromReservation < ActiveRecord::Migration[5.0]
  def change
  	remove_column :reservations, :category_id
  end
end
