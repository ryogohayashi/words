class Group < ApplicationRecord
  has_many :words, -> { order(position: :asc) }
  belongs_to :user
end
