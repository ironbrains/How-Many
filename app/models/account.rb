class Account < ActiveRecord::Base
  enum types: [
    :cheque,
    :savings,
    :credit_card,
    :cash,
    :other
  ]

  belongs_to :user

  has_many :transactions
  has_many :incoming_transactions, class_name: 'Transaction', foreign_key: 'payee_account_id'

  before_destroy { balance.zero? }

  def deposit(sum)
    transaction_params = {
      name: 'Deposit to #{name} at {DateTime.now}',
      status: Transaction.statuses[:done],
      amount: sum
    }
    transaction do
      increment :balance, sum
      transactions.create transaction_params
    end
  end

  def withdraw(sum)
    new_balance = balance - sum
    if new_balance > 0
      transaction_params = {
        name: 'Withdraw from #{name} at {DateTime.now}',
        status: Transaction.statuses[:done],
        amount: -sum
      }
      decrement :balance, sum
      transactions.create transaction_params
    end
  end
end
