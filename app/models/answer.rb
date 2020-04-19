class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :answer_body, presence: true
end
