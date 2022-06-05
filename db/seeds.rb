# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Seeding...'

User.create(full_name: 'User Test', email: 'admin@nlr.com', password: 'testen', password_confirmation: 'testen')
User.last.bookmarks.create(name: 'Test Bookmark', favorite: false)
Bookmark.last.graphs << Graph.create(name: 'Test Graph', property: 'COG_dev_y')

puts 'Seeding done.'
