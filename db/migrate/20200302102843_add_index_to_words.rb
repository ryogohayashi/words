class AddIndexToWords < ActiveRecord::Migration[5.2]
  def change
    add_index :words, :word, length: 32
  end
end
