class Feed < ApplicationRecord
  belongs_to :batch

  has_many :feed_ingredients, dependent: :restrict_with_error
  has_many :ingredients, through: :feed_ingredients, dependent: :restrict_with_error

  validates :feed_quantity_per_chicken, :total_chickens, :date, presence: true
  validate :feed_date_cannot_be_before_batch_date

  def feed_date_cannot_be_before_batch_date
    if batch.present? && date < batch.start_date
      errors.add(:date, 'cannot be less than its batch date')
    end
  end
end
