# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = 20.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email => Faker::Internet.safe_email,
                :password => 'password',
                :first_name => Faker::Name.first_name,
                :last_name => Faker::Name.last_name )
end

future_events = 15.times.map do
  Event.create!( :location => Faker::Address.street_address,
                 :date => 20160610,
                 :host => User.all.sample,
                 :description => Faker::Lorem.paragraph,
                 :title => Faker::Lorem.sentence)
end

past_events = 15.times.map do
  Event.create!( :location => Faker::Address.street_address,
                 :date => 20160510,
                 :host => User.all.sample,
                 :description => Faker::Lorem.paragraph,
                 :title => Faker::Lorem.sentence)
end

Invites = 100.times.map do
  Invite.create!( :attendee => User.all.sample,
                  :attended_event => Event.all.sample)
end

items = 60.times.map do
  Item.create!( :name => Faker::Lorem.word,
                :user => User.all.sample,
                :event => Event.all.sample)
end

