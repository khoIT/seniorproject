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
r1 = Micropost.create(start: 'DePauw', destination: 'Chicago', time: Time.now, passengers_number: 4)
r2 = Micropost.create(start: 'DePauw', destination: 'Indy', time: Time.now, passengers_number: 3)
r1.passengers = [u2,u3]
r2.passengers = [u1,u4]
r1.owners = u1
r2.owners = u2
