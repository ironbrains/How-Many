FactoryGirl.define do
  factory :account do
    name "My Account"
    type 0
    user
    balance 0.00
  end
end
