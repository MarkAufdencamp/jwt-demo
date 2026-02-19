class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.references :domain, null: false, foreign_key: true
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :accounts, [:domain_id, :username], unique: true
  end
end
