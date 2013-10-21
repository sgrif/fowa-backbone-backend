class Note < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validate :ensure_title_or_content

  private

  def ensure_title_or_content
    unless title.present? || content.present?
      errors.add(:title, :blank)
    end
  end
end
