# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Khoi', password:'123!@#ab', email: 'khoitran_2014@depauw.edu', driver: true)
u2 = User.create(name: 'Anna', password:'123!@#ab', email: 'annasmith_2015@depauw.edu')
u3 = User.create(name: 'Jack', password:'123!@#ab', email: 'jackallen_2016@depauw.edu', driver: true)
u4 = User.create(name: 'Amelia', password:'123!@#ab', email: 'ameliachan_2017@depauw.edu')
r1 = Ride.create(start: 'DePauw', destination: 'Chicago', time: Time.new(2014, 9, 21, 22, 35, 0), seats_left: 3)
r2 = Ride.create(start: 'DePauw', destination: 'Indy', time: Time.new(2014, 10, 29, 22, 35, 0), seats_left: 2)
r3 = Ride.create(start: 'Louisville', destination: 'DePauw', time: Time.new(2015, 3, 19, 22, 35, 0), seats_left: 3)
r4 = Ride.create(start: 'DePauw', destination: 'Walmart', time: Time.new(2014, 11, 9, 22, 35, 0), seats_left: 3)
u1.fares << [r1,r2,r3]
r1.passengers << u2
r1.passenger_rides.find_by_passenger_id(u2.id).update_attributes!(confirmed: "true")
r1.passengers << u3
r1.passenger_rides.find_by_passenger_id(u3.id).update_attributes!(confirmed: "true")
