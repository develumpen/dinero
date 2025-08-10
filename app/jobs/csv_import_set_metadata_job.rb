class CsvImportSetMetadataJob < ApplicationJob
  queue_as :default

  def perform(csv_import_id)
    csv_import = CsvImport.find(csv_import_id)
    csv_rows = CSV.parse(csv_import.file.download)

    # i cannot get first/last_transaction_date because i don't know which column has the date :(
    csv_import.update({ transactions_count: csv_rows.count })
  end
end
