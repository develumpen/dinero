class Account < ApplicationRecord
  has_many :imports, dependent: :destroy

  validates_presence_of :name
end
