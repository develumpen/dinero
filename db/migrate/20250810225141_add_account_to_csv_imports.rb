class AddAccountToCsvImports < ActiveRecord::Migration[8.0]
  def change
    add_reference :csv_imports, :account, null: false, foreign_key: true
  end
end
