# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tag1 = Tag.new
tag1.name = "mess"
tag1.save

tag2 = Tag.new
tag2.name = "stufac"
tag2.save

tag3 = Tag.new
tag3.name = "gen"
tag3.save

tag4 = Tag.new
tag4.name = "scrap"
tag4.save
