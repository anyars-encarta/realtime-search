class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  scope :search, ->(query) { where('title ILIKE :query OR content ILIKE :query', query: "%#{query}%") }
end
