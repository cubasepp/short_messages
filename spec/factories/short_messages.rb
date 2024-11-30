FactoryBot.define do
  factory :short_message do
    message { Faker::Lorem.sentence }
  end
end
