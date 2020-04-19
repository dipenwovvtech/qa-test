require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.name                      { Faker::Name.name }
    f.email                     { |n| "test_user#{n}@" + Faker::Internet.domain_name }
    f.password                  { Faker::Internet.password(min_length: 10) }
    f.password_confirmation     { |instance| instance.password }
  end
end
