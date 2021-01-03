FactoryBot.define do
	factory :contact do
	  first_name { Faker::Name::first_name }
	  last_name { Faker::Name::last_name }
	  sequence(:email) {|n| "contact#{n}@blow.com" }
	  phone { "8755667762"}
	  message { Faker::Lorem.characters }
	end
end