class CsvImport < ApplicationRecord
  belongs_to :account, optional: true

  has_one_attached :file
end
