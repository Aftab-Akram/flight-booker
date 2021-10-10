
airport1 = Airport.create!(name: Faker::Address.city, country: Faker::Address.country)
airport2 = Airport.create!(name: Faker::Address.city, country: Faker::Address.country)
airport3 = Airport.create!(name: Faker::Address.city, country: Faker::Address.country)
airport4 = Airport.create!(name: Faker::Address.city, country: Faker::Address.country)

Flight.create!(from_airport_id: airport1.id, to_airport_id: airport2.id, flight_date: Date.today, duration: "2-hours")
Flight.create!(from_airport_id: airport3.id, to_airport_id: airport4.id, flight_date: Date.today, duration: "2-hours")
Flight.create!(from_airport_id: airport1.id, to_airport_id: airport3.id, flight_date: Date.today, duration: "2-hours")
Flight.create!(from_airport_id: airport4.id, to_airport_id: airport2.id, flight_date: Date.today, duration: "2-hours")
Flight.create!(from_airport_id: airport2.id, to_airport_id: airport3.id, flight_date: Date.today, duration: "2-hours")
Flight.create!(from_airport_id: airport3.id, to_airport_id: airport1.id, flight_date: Date.today, duration: "2-hours")