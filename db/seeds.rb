# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Khoi', password:'123!@#ab', email: 'khoitran_2014@depauw.edu')
u2 = User.create(name: 'Anna', password:'123!@#ab', email: 'annasmith_2015@depauw.edu')
u3 = User.create(name: 'Jack', password:'123!@#ab', email: 'jackallen_2016@depauw.edu')
u4 = User.create(name: 'Amelia', password:'123!@#ab', email: 'ameliachan_2017@depauw.edu')
r1 = Ride.create(start: 'DePauw', destination: 'Chicago', time: Time.new(2014, 8, 21, 22, 35, 0), seats_left: 2)
r2 = Ride.create(start: 'DePauw', destination: 'Indy', time: Time.new(2014, 8, 29, 22, 35, 0), seats_left: 2)
r3 = Ride.create(start: 'Louisville', destination: 'DePauw', time: Time.new(2015, 3, 19, 22, 35, 0), seats_left: 1)
r4 = Ride.create(start: 'New York', destination: 'DePauw', time: Time.new(2014, 9, 9, 22, 35, 0), seats_left: 4)
r5 = Ride.create(start: 'DePauw', destination: 'Boston', time: Time.new(2014, 10, 9, 22, 35, 0), seats_left: 4)
r6 = Ride.create(start: 'DePauw', destination: 'Walmart', time: Time.new(2014, 11, 9, 22, 35, 0), seats_left: 6)
r7 = Ride.create(start: 'Walmart', destination: 'DePauw', time: Time.new(2014, 10, 13, 22, 35, 0), seats_left: 5)
r8 = Ride.create(start: '407 S.Jackson', destination: 'Prindle Institute', time: Time.new(2014, 10, 13, 22, 35, 0), seats_left: 4)
r1.passengers = [u2,u3]
r2.passengers = [u3,u4]
r3.passengers = [u2,u3,u4]
u1.fares << [r1,r2]
