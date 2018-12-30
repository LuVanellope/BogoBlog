class Post < ApplicationRecord
  has_many :comments
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def published_date
    "Published #{created_at.strftime('%-b %-d, %Y')}"
  end
end
