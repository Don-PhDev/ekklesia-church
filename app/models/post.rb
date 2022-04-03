class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true, allow_blank: false

  scope :by_recently_updated, -> { order(updated_at: :desc) }
end
