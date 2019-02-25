FactoryBot.define do
  factory :user, class: User do
    sequence :name { |n| "user_#{n}" }
    email {Faker::Internet.email}
    password {"123"}
  end
end
