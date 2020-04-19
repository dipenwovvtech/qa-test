require 'faker'

FactoryBot.define do
  factory :question do |f|
    f.name                    { Faker::Lorem.question }
    topic
    user
  end
end
