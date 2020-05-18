class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user, optional: true
  accepts_nested_attributes_for :options, allow_destroy: true
  
  validates :title, presence: true
end
