class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string     :name
      t.integer    :type
      t.references :user, index: true, foreign_key: true
      t.decimal    :balance, precision: 12, scale: 2, default: 0.0, null: false

      t.timestamps null: false
    end
  end
end
