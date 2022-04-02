class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true, allow_blank: false
end
