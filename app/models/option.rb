class Option < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :question

  validates :title, presence: true
end
