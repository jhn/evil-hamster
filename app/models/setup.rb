require 'date'

galactica = SpaceShip.new
galactica.name = "Galactica"

olive = Pet.new
olive.name = "Olive"
olive.age = 2
olive.date_of_birth = Date.new(2013, 12, 12)

peach = Pet.new
peach.name = "Peach"
peach.age = 2
peach.date_of_birth = Date.new(2013, 12, 12)

u = User.new
u.first_name = "Joe"
u.last_name = "Doe"
u.email = "a@b.com"
u.pets = [olive, peach]
u.spaceShip = galactica

galactica.save!
olive.save!
peach.save!
u.save!
