class Account < ActiveRecord::Base
  belongs_to :user

  enum types: [
    :cheque,
    :savings,
    :credit_card,
    :cash,
    :other
  ]
end
