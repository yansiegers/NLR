# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Seeding...'

user = User.last # created in user db migration

graph_category1 = GraphCategory.create(name: 'Weight & balance')
graph_category2 = GraphCategory.create(name: 'Temperature')
graph_category3 = GraphCategory.create(name: 'Speed')

graph_category1.graphs << Graph.create([
  { name: 'Weight', property: 'Weight' },
  { name: 'Center of gravity deviation Y', property: 'COG_dev_y' }
])
graph_category2.graphs << Graph.create([
  { name: 'Temperature front left', property: 'temp_front_left' },
  { name: 'Temperature front right', property: 'temp_front_right' }
])
graph_category3.graphs << Graph.create(name: 'Pitot tube', property: 'pitot_tube')

workspace1 = user.workspaces.create(name: 'Workspace 1', favorite: false)
workspace2 = user.workspaces.create(name: 'Workspace 2', favorite: false)
workspace3 = user.workspaces.create(name: 'Workspace 3', favorite: false)

workspace1.graphs << graph_category1.graphs
workspace1.graphs << graph_category2.graphs

workspace2.graphs << graph_category2.graphs
workspace2.graphs << graph_category3.graphs

workspace3.graphs << graph_category3.graphs
workspace3.graphs << graph_category1.graphs

puts 'Seeding done.'
