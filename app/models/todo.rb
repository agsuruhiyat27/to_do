class Todo < ApplicationRecord
  has_paper_trail
  belongs_to :user
  validate :due_date_validate
  validates :title, :description, :due_date, :status, presence: true
  validates :status, inclusion: { in: ["terselesaikan", "belum terselesaikan"] }

  private

  def due_date_validate
    if due_date.present? && due_date <= Date.today
      errors.add(:due_date, "must be greater than today")
    end
  end
end