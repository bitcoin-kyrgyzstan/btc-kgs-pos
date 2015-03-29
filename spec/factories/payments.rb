FactoryGirl.define do
  factory :payment do
    organization
    amount_in_kgs 1234.56
    luid 4321
    btc_kgs_exchange_rate 0.0123
  end
end
