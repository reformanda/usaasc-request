# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
user2 = CreateNonadminService.new.call
puts 'CREATED NON-ADMIN USER: ' << user2.email
user3 = CreateApproverService.new.call
puts 'CREATED Approver USER: ' << user3.email
user4 = CreateWorkerService.new.call
puts 'CREATED Worker USER: ' << user4.email
