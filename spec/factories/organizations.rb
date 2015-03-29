FactoryGirl.define do
  factory :organization do
    sequence(:token) { |n| "SuperUniqueToken#{n}" }
  end
end
