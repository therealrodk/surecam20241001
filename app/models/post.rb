class Post < ApplicationRecord
  has_rich_text :body

  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :active, -> { where(active: true) }
  scope :newest_first, -> { order(created_at: :desc) }

  validates_presence_of :title
  validate :has_body

  def has_body
    unless body&.body&.present?
      errors.add(:body, "can't be blank")
    end
  end
end
