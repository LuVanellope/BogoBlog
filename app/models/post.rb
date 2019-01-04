class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :body, presence: true, length: { minimum: 250 }
	validates :title, presence: true
	validates :banner_image_url, presence: true


  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def published_date
    "Published #{created_at.strftime('%-b %-d, %Y')}"
  end
end
