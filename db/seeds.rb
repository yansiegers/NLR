# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Seeding...'

user = User.last # created in user db migration

bookmark1 = user.bookmarks.create(name: 'Weight & balance', favorite: false)
bookmark2 = user.bookmarks.create(name: 'Temperature', favorite: false)
bookmark3 = user.bookmarks.create(name: 'Speed', favorite: false)

bookmark1.graphs << Graph.create([
  { name: 'Weight', property: 'Weight' },
  { name: 'Center of gravity deviation Y', property: 'COG_dev_y' }
])
bookmark2.graphs << Graph.create([
  { name: 'Temperature front left', property: 'temp_front_left' },
  { name: 'Temperature front right', property: 'temp_front_right' }
])
bookmark3.graphs << Graph.create(name: 'Pitot tube', property: 'pitot_tube')

puts 'Seeding done.'
