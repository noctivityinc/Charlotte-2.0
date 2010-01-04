# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:name => 'Joshua Lippiner', :email => 'jlippiner@repuguard.com', :password => 'venecian', :login => 'jlippiner', :password_confirmation => 'venecian')

1.upto(15).each do |x|
  Supporter.create(:name => 'Jimbo Jones', :email => "test#{x}@test.com", :website => "www.test#{x}.com")
end
