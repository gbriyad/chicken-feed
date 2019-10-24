class Batch < ApplicationRecord
  belongs_to :shade
  validates :name, :start_date, presence: true
end
