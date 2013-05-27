# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Roles
r1 = Role.create(:code => 'ADMIN', :name => 'Administrator')
r2 = Role.create(:code => 'USER', :name => 'General User')

# Create Users
u1 = User.create(:uuid => 'O000633', :first_name => 'Dean', :middle_name => 'Robert', :last_name => 'Vonk', :email => 'dean.vonk@gmail.com')

# Create Groups
g1 = Group.create(:code => 'BSB', :name => 'Budget Systems Branch')

# Create User Groups
ug1 = UserGroup.create(:user => u1, :group => g1)

# Create Exercises
e1 = Exercise.create(:code => 'MAXCAL', :name => 'MAX Calendar')

# Create Categories
c1 = Category.create(:code => 'PERSONAL_CALENDARS', :name => 'Peronal Calendars')
c2 = Category.create(:code => 'OTHER_CALENDARS', :name => 'Other Calendars')

# Create Items
i1 = Item.create(:code => 'MAX_CONTRACTORS', :name => 'MAX Contractors')
i2 = Item.create(:code => 'O000633', :name => 'Vonk, Dean (OMB,CTR)')

# Create Exercise Nodes
n1 = Node.create(:describer => e1)

# Create Category Nodes
n2 = Node.create(:parent_id => n1.id, :describer => c1)
n3 = Node.create(:parent_id => n1.id, :describer => c2)

# Create Item Nodes
n4 = Node.create(:parent_id => n2.id, :describer => i1)
n5 = Node.create(:parent_id => n3.id, :describer => i2)
