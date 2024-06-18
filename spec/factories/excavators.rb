FactoryBot.define do
  factory :excavator do
    company_name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    excavator_type { "MyString" }
    contact_name { "MyString" }
    contact_phone { "MyString" }
    contact_email { "MyString" }
    field_contact_name { "MyString" }
    field_contact_phone { "MyString" }
    field_contact_email { "MyString" }
    crew_onsite { false }
    ticket { nil }
  end
end
