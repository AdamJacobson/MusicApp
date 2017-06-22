# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
Album.destroy_all
Track.destroy_all

bt = Band.create!(name: "Brothertiger")
oot = Album.create!(name: "Out of Touch", band_id: bt.id)
Track.create!(name: "Jungle Floor", album_id: oot.id)
Track.create!(name: "High Tide", album_id: oot.id)
Track.create!(name: "Wake", album_id: oot.id)

shark = Band.create!(name: "Shark Tester")
hammer = Album.create!(name: "Hammerhead Revue", band_id: shark.id)
Track.create!(name: "Teeth", album_id: hammer.id)
Track.create!(name: "Fins", album_id: hammer.id)
Track.create!(name: "Blood In The Water", album_id: hammer.id)
