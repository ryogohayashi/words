class Word < ApplicationRecord
  belongs_to :user
  belongs_to :group
  acts_as_list scope: :parent

  mount_uploader :image, ImageUploader


end
