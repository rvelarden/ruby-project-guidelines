# Musician.destroy_all

Musician.create(name: "Chelsea Lane", genre: "classical", instrument: "harp", price: 200.00, city: "Pittsburgh", active: 1, rating: 10)
Musician.create(name: "Carolyn Edwards", genre: "classical", instrument: "violin", price: 50.00, city: "Pittsburgh", active: 1, rating: 10)
Musician.create(name: "Romina Velarde", genre: "electronic", instrument: "dj", price: 100.00, city: "Pittsburgh", active: 1, rating: 7)
Musician.create(name: "Alex Vourtsanis", genre: "electronic", instrument: "dj", price: 300.00, city: "New York", active: 0, rating: 10)
Musician.create(name: "Scott McCreary", genre: "classical", instrument: "cello", price: 150.00, city: "Phoenix", active: 0, rating: 9)
Musician.create(name: "Miles Davis", genre: "jazz", instrument: "jazz", price: 1000.00, city: "New York", active: 1, rating: 10)
Musician.create(name: "Natalie Severson", genre: "classical", instrument: "harp", price: 200.00, city: "Pittsburgh", active: 1, rating: 8)
Musician.create(name: "Lady Gaga", genre: "pop", instrument: "voice", price: 50000.00, city: "Los Angeles", active: 1, rating: 10)
Musician.create(name: "Revanth", genre: "classical", instrument: "violin", price: 5.00, city: "Pittsburgh", active: 1, rating: 1)
Musician.create(name: "Maren Rothfritz", genre: "classical", instrument: "viola", price: 150.00, city: "Philadelphia", active: 1, rating: 10)
Musician.create(name: "Rosie Gallagher", genre: "classical", instrument: "flute", price: 110.00, city: "Sydney", active: 1, rating: 10)

# Gig.destroy_all

Gig.create(name: "Nat and Quinn's engagement party", city: "Pittsburgh", pay: 20.00, category: "wedding")
Gig.create(name: "COVID Rager", city: "Pittsburgh", pay: 200.00, category: "party")
Gig.create(name: "Meditation with Music", city: "New York", pay: 400.00, category: "other")
Gig.create(name: "Becky and Rick's Wedding", city: "Philadelphia", pay: 100.00, category: "wedding")
Gig.create(name: "Christmas Spectacular", city: "New York", pay: 18000.00, category: "broadway show")
Gig.create(name: "Stevie's Bar Mitzvah", city: "Pittsburgh", pay: 100.00, category: "party")

Contract.create(musician_id: 1, gig_id: 1)
Contract.create(musician_id: 1, gig_id: 2)
Contract.create(musician_id: 2, gig_id: 6)


puts "Seed file ran"