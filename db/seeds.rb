# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Articles
first_article = Article.create(title: 'Home', content: 'Home is awesome')
second_article = Article.create(title: 'School', content: 'School is tiring')
third_article = Article.create(title: 'Barracks', content: 'Barracks is scary')
fourth_article = Article.create(title: 'Hospital', content: 'Hospital is pathetic')
fifth_article = Article.create(title: 'Church', content: 'Church is powerful')
sixth_article = Article.create(title: 'Sports', content: 'Sports is boring')
seventh_article = Article.create(title: 'Movie', content: 'Movie is interesting')
eigth_article = Article.create(title: 'Chatting', content: 'Chatting is fun')
nineth_article = Article.create(title: 'Teasing', content: 'Teasing is hilarious')
tenth_article = Article.create(title: 'Silence', content: 'Silence is a killer disease')