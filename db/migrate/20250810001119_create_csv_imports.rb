class CreateCsvImports < ActiveRecord::Migration[8.0]
  def change
    create_table :csv_imports do |t|

      t.timestamps
    end
  end
end
