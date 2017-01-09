class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string     :name
      t.decimal    :amount, null: false, default: 0.0, precision: 12, scale: 2
      t.integer    :status, null: false, default: 0
      t.references :account,       index: true, foreign_key: true
      t.references :payee,         index: true
      t.references :payee_account, index: true
      t.string     :payee_name

      t.timestamps null: false
    end
  end
end
