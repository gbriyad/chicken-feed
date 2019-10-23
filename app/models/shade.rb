class Shade < ApplicationRecord
  belongs_to :branch
  validates :name, presence: true
end
