class Transaction < ActiveRecord::Base
  enum statuses: [
    :uncofirmed,
    :done
  ]
  belongs_to :account
  belongs_to :payee,         class_name: 'User'
  belongs_to :payee_account, class_name: 'Account'
end
