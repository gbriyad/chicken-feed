class Shade < ApplicationRecord
  belongs_to :branch
  has_many :batches, dependent: :restrict_with_error
  validates :name, presence: true
end
