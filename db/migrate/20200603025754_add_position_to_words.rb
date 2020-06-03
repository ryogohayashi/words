class AddPositionToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :position, :integer
  end
end
