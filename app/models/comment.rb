class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  scope :newest_first, -> { order(created_at: :desc) }

  validate :has_body

  def has_body
    unless body&.body&.present?
      errors.add(:body, "can't be blank")
    end
  end
end
