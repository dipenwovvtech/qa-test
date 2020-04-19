require 'faker'

FactoryBot.define do
  factory :topic do |f|
    f.name            { Faker::Name.name }
  end
end
