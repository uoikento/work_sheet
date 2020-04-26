class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user, optional: true
  accepts_nested_attributes_for :options, allow_destroy: true
  
  def count_vote(a)
    k = Vote.where(question_id: a).count
    # return k
  end
end
