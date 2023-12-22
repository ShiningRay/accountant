class CreateAccountantAccountLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :accountant_account_logs do |t|
      t.integer :account_id, null: false
      t.decimal :delta, null: false
      t.decimal :balance_after, null: false
      t.integer :related_account_id
      t.string :memo
      t.string :cause_type
      t.integer :cause_id

      t.timestamps
    end
    add_index :accountant_account_logs, :account_id
  end
end
