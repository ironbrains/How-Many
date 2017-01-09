FactoryGirl.define do
  factory :transaction do
    name "MyString"
    account nil
    payee nil
    account_of_payee nil
    amount "9.99"
    category nil
  end
end
