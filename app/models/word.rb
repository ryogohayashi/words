class Word < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.search(search)
    return Word.all unless search
    Word.where(['word LIKE ?', "%#{search}%"])
  end

  mount_uploader :image, ImageUploader


end
