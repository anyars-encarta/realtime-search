class Article < ApplicationRecord
  scope :search, ->(query) { where('title ILIKE ?', "%#{query}%") }
end
