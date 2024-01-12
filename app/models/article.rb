class Article < ApplicationRecord
  scope :search, ->(query) { where('title ILIKE :query OR content ILIKE :query', query: "%#{query}%") }
end
