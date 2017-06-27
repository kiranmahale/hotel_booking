class RenammingCategoryToRoomcategoryId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :rooms, :category_id, :roomcategory_id
  end
end
