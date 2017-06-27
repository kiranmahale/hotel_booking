class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :date_in
      t.datetime :date_out
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
