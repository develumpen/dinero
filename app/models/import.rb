class Import < ApplicationRecord
  belongs_to :account
  has_one_attached :file
end
