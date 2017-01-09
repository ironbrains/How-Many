class Account < ActiveRecord::Base

  enum types: [
    :cheque,
    :savings,
    :credit_card,
    :cash,
    :other
  ]

  belongs_to :user

  has_many :sendings,     class_name: 'Transaction', foreign_key: 'sender_id'
  has_many :receivements, class_name: 'Transaction', foreign_key: 'receiver_id'

  def deposit(sum)
    update_attribute :balance, self.balance + sum
  end

  def withdraw(sum)
    new_ammount = self.balance - sum
    update_attribute(:balance, new_ammount) if new_ammount > 0
  end
end
