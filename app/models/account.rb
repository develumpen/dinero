class Account < ApplicationRecord
  has_many :csv_imports

  validates :name, presence: true
end
