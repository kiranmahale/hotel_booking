class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.boolean :is_booked, default: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
