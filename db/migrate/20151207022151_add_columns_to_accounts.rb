class AddColumnsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_id, :integer
    add_column :accounts, :name, :string
    add_column :accounts, :status, :boolean
    add_column :accounts, :active_at, :timestamp
    add_column :accounts, :expire_at, :timestamp
  end
end
