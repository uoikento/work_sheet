class Vote < ApplicationRecord
  belongs_to :question
  belongs_to :option

  enum role: { "正社員": 0, "契約社員": 1}
end
