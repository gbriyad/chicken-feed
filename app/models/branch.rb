class Branch < ApplicationRecord
  has_many :shades, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
