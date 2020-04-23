class Option < ApplicationRecord
  has_many :votes
  belongs_to :question
end
