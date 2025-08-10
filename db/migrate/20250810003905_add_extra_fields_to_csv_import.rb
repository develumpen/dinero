class AddExtraFieldsToCsvImport < ActiveRecord::Migration[8.0]
  def change
    add_column :csv_imports, :first_transaction_date, :date
    add_column :csv_imports, :last_transaction_date, :date
    add_column :csv_imports, :transactions_count, :integer
  end
end
