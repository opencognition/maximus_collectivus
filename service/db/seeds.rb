# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Roles
@role_owner = Role.create(:code => 'OWNER', :name => 'Owner')
@role_editor = Role.create(:code => 'EDITOR', :name => 'Editor')
@role_author = Role.create(:code => 'AUTHOR', :name => 'Author')
@role_reviewer = Role.create(:code => 'REVIEWER', :name => 'Reviewer')
@role_publisher = Role.create(:code => 'PUBLISHER', :name => 'Publisher')
@roles = Role.all

# Create Groups
g1 = Group.create(:code => 'BSB', :name => 'Budget Systems Branch')
Group.create(:code => 'USDA',   :name => 'Department of Agriculture')
Group.create(:code => 'DOC',    :name => 'Department of Commerce')
Group.create(:code => 'DOD',    :name => 'Department of Defense')
Group.create(:code => 'ED',     :name => 'Department of Education')
Group.create(:code => 'DOE',    :name => 'Department of Energy')
Group.create(:code => 'HHS',    :name => 'Department of Health and Human Services')
Group.create(:code => 'DHS',    :name => 'Department of Homeland Security')
Group.create(:code => 'HUD',    :name => 'Department of Housing and Urban Development')
Group.create(:code => 'DOJ',    :name => 'Department of Justice')
Group.create(:code => 'DOL',    :name => 'Department of Labor')
Group.create(:code => 'DOS',    :name => 'Department of State')
Group.create(:code => 'DOI',    :name => 'Department of the Interior')
Group.create(:code => 'DOT',    :name => 'Department of Transportation')
Group.create(:code => 'VA',     :name => 'Department of Veterans Affairs')
Group.create(:code => 'TREAS',  :name => 'Department of the Treasury')
groups = Group.all

# Create Users
@dean = User.create(:password => 'password', :uuid => 'O000633', :first_name => 'Dean', :middle_name => 'Robert', :last_name => 'Vonk', :email => 'dean.vonk@gmail.com')
1000.times do
    g = groups.sample
    first_name = Faker::Name.first_name
    middle_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "#{first_name}_#{middle_name[0]}._#{last_name}@#{g.code}.gov".downcase
    uuid = last_name.upcase
    u = User.create(
        :password => 'password',
        :uuid => uuid,
        :first_name => first_name,
        :middle_name => middle_name,
        :last_name => last_name,
        :email => email
    )
    UserGroup.create(:user => u, :group => g)
end
@users = User.all

# Create User Groups
ug1 = UserGroup.create(:user => @dean, :group => g1)

# Create Exercises
e1 = Exercise.create(:code => 'MAXCAL', :name => 'MAX Calendar')
e2 = Exercise.create(:code => 'PERMITTING', :name => 'Permitting')

# Create Categories
c1 = Category.create(:code => 'PERSONAL_CALENDARS', :name => 'Personal Calendars')
c2 = Category.create(:code => 'OTHER_CALENDARS', :name => 'Other Calendars')
c3 = Category.create(:code => 'PROJECTS', :name => 'Projects')

# Create Items
i1 = Item.create(:code => 'MAX_CONTRACTORS', :name => 'MAX Contractors')
i2 = Item.create(:code => 'O000633', :name => 'Vonk, Dean (OMB,CTR)')
i3 = Item.create(:code => 'BAYONNE_BRIDGE', :name => 'Bayonne Bridge')

# Create Exercise Nodes
n1 = Node.create(:describer => e1)
n2 = Node.create(:describer => e2)

# Create Category Nodes
n1_1 = Node.create(:parent_id => n1.id, :describer => c1)
n1_2 = Node.create(:parent_id => n1.id, :describer => c2)
n2_1 = Node.create(:parent_id => n2.id, :describer => c3)

# Create Item Nodes
n1_1_1 = Node.create(:parent_id => n1_1.id, :describer => i1)
n1_2_1 = Node.create(:parent_id => n1_2.id, :describer => i2)
n2_1_1 = Node.create(:parent_id => n2_1.id, :describer => i3)

# Workflow Statuses
ws1 = WorkflowStatus.create(:code => 'SETUP', :name => 'Setup', :description => 'Setup phase')
ws2 = WorkflowStatus.create(:code => 'ACTIVE', :name => 'Active', :description => 'Actively in use')
ws3 = WorkflowStatus.create(:code => 'PUBLISHED', :name => 'Published', :description => 'Published and closed')

# Workflows
n1.workflows.create(:workflow_status => ws1)
n1.workflows.create(:workflow_status => ws2)

n2.workflows.create(:workflow_status => ws1)
n2.workflows.create(:workflow_status => ws2)
n2.workflows.create(:workflow_status => ws3)

# Generate random nodes or varying depth and assign random authorizations
sub_category_counts = (0..3).to_a
category_counts = (1..4).to_a
item_counts = (0..10).to_a
250.times do
    ename = Faker::Company.name
    ecode = ename.upcase
    e = Exercise.create(:code => ecode, :name => ename, :description => Faker::Company.bs)
    en = Node.create(:describer => e)
    owner = @users.sample
    en.authorizations.create(:user => owner, :role => @role_owner)
    category_counts.sample.times do
        cname = Faker::Company.name
        ccode = cname.upcase
        c = Category.create(:code => ccode, :name => cname, :description => Faker::Company.bs)
        cn = Node.create(:parent_id => en.id, :describer => c)
        cn.authorizations.create(:user => owner, :role => @role_owner)
        item_counts.sample.times do
            iname = Faker::Company.name
            icode = iname.upcase
            i = Item.create(:code => icode, :name => iname, :description => Faker::Company.bs)
            inode = Node.create(:parent_id => cn.id, :describer => i)
            inode.authorizations.create(:user => owner, :role => @role_owner)
        end
    end
end

@exercises = Exercise.all
@categories = Category.all
@items = Item.all

# Grant @dean OWNER role to random exercise, category, and item nodes 
3.times do
    exercise = @exercises.sample
    category = @categories.sample
    item = @items.sample
    @dean.authorizations.create(:node => exercise.node, :role => @role_owner)
    @dean.authorizations.create(:node => category.node, :role => @role_owner)
    @dean.authorizations.create(:node => item.node, :role => @role_owner)
end

