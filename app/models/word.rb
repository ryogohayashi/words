class Word < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  include RankedModel 
  ranks :row_order , with_same: :group_id 

  def self.search(search)
    return Word.all unless search
    Word.where(['word LIKE ?', "%#{search}%"])
  end

  mount_uploader :image, ImageUploader


end
