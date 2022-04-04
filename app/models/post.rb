class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user

  has_rich_text :content

  validates :title, :content, presence: true, allow_blank: false

  scope :by_recently_updated, -> { order(updated_at: :desc) }

  def posted_time_passed
    if self.updated_at - self.created_at > 1
      "Edited " + time_ago_in_words(self.updated_at) + " ago"
    else
      "Posted " + time_ago_in_words(self.created_at) + " ago"
    end
  end

  def content_joined_text
    return first_content if first_content == last_content

    [first_content, last_content].join(" ").squeeze(" ")
  end

  def first_content
    content_text&.first&.squish
  end

  def last_content
    content_text&.last&.split("]")&.last&.squish
  end

  private

    def content_text
      self.content&.to_plain_text&.squish&.split("[")
    end
end
