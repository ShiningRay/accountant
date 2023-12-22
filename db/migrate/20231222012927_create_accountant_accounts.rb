class CreateAccountantAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accountant_accounts do |t|
      t.integer :owner_id, null: false
      t.integer :nonce, default: 0, null: false
      t.decimal :balance, precision: 32, scale: 10, default: 0
      t.string :label
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
    add_index :accountant_accounts, %i[owner_id label nonce], unique: true
  end
end
