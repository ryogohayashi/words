class Group < ApplicationRecord
  has_many :words
  belongs_to :user
end
