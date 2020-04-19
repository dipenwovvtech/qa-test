require 'faker'

FactoryBot.define do
  factory :answer do |f|
    f.answer_body         { Faker::Lorem.paragraph }
    question
    user
  end

end
