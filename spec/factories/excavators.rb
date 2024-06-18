FactoryBot.define do
  factory :excavator do
    company_name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    excavator_type { "Contractor" }
    contact_name { Faker::Name.name }
    contact_phone { Faker::PhoneNumber.phone_number }
    contact_email { Faker::Internet.email }
    field_contact_name { Faker::Name.name }
    field_contact_phone { Faker::PhoneNumber.phone_number }
    field_contact_email { Faker::Internet.email }
    crew_onsite { true }
    ticket
  end
end
