class AddRowOrderToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :row_order, :integer
  end
end
