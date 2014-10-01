# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Khoi', password:'123!@#ab', email: 'khoitran_2014@depauw.edu', driver: true, confirmed_at: Time.now)
u2 = User.create(name: 'Anna', password:'123!@#ab', email: 'annasmith_2015@depauw.edu', confirmed_at: Time.now)
u3 = User.create(name: 'Jack', password:'123!@#ab', email: 'jackallen_2016@depauw.edu', driver: true, confirmed_at: Time.now)
u4 = User.create(name: 'Amelia', password:'123!@#ab', email: 'ameliachan_2017@depauw.edu', confirmed_at: Time.now)
r1 = Ride.create(start: 'DePauw', destination: 'Chicago', start_time: Time.new(2014, 9, 21, 22, 35, 0), end_time: Time.new(2014, 9, 22, 22, 35, 0), seats_left: 3, cost: 75)
r2 = Ride.create(start: 'DePauw', destination: 'Indy', start_time: Time.new(2014, 10, 29, 22, 35, 0), end_time: Time.new(2014, 10, 30, 22, 35, 0), seats_left: 2, cost: 25)
r3 = Ride.create(start: 'Louisville', destination: 'DePauw', start_time: Time.new(2015, 3, 19, 22, 35, 0), end_time: Time.new(2015, 3, 20, 22, 35, 0), seats_left: 3, cost: 30)
r4 = Ride.create(start: 'DePauw', destination: 'Walmart', start_time: Time.new(2014, 11, 9, 22, 35, 0), end_time: Time.new(2014, 11, 10, 22, 35, 0))
u1.fares << [r1,r2,r3]
u2.hop_on!(r1)
r1.accept(u2)
u3.hop_on!(r1)
r1.accept(u3)
