FactoryBot.define do
  factory :user do
    # use sequence to make sure the value is unique
    sequence(:email) { |n| "user-#{n}@example.com"}
  end

  factory :item do
    sequence(:item){ |n| "item-#{n}"}
    user
  end
end