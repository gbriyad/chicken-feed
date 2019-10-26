class Batch < ApplicationRecord
  belongs_to :shade
  has_many :feeds, dependent: :restrict_with_error
  validates :name, :start_date, presence: true
  def branch_shade_name_start_date
    shade.branch.name + '>' + shade.name + '>' + name + '(started on: ' + start_date.strftime('%d %B, %Y') + ')'
  end
end
