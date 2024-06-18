FactoryBot.define do
  factory :ticket do
    request_number { Faker::Number.number(digits: 10) }
    reference_request_number { "" }
    version_number { 1 }
    sequence_number { Faker::Number.number(digits: 4) }
    request_type { "Normal" }
    request_action { "Restake" }
    primary_service_area_code { "ZZGL103" }
    additional_service_area_codes { [ "ZZL01", "ZZL02", "ZZL03" ] }
    type_of_work { "rpr man hole tops" }
    work_done_for { "gpc" }
    project_duration { "5 days" }
    explosives { false }
    underground_overhead { "Underground" }
    horizontal_boring { "No" }
    whitelined { false }
    locate_instructions { "Locate the entire property" }
    remarks { "No remarks" }
    well_known_text { "POLYGON((-81.13390268058475 32.07206917625161, -81.13390268058475 32.07206917625161, -81.13390268058475 32.07206917625161, -81.13390268058475 32.07206917625161))" }
    project_start_date { Faker::Date.forward(days: 1) }
    request_taken_at { Faker::Time.forward(days: 14, period: :morning) }
    legal_at { Faker::Time.forward(days: 5, period: :morning) }
    response_due_at { Faker::Time.forward(days: 10, period: :morning) }
    restake_at { Faker::Time.forward(days: 20, period: :morning) }
    expiration_at { Faker::Time.forward(days: 25, period: :morning) }
    digsite_info {
      {
        lookup_by: "MANUAL",
        location_type: "Multiple Address",
        address_info: {
          state: "ST",
          county: "COUNTY",
          place: "PLACE",
          address: {
            address_num: [ "Address 1", "Address 2" ]
          },
          street: {
            prefix: "",
            name: "Trinity",
            type: "Ave",
            suffix: "SW"
          }
        },
        near_street: {
          state: "XX",
          county: "SomeCounty",
          place: "City"
        },
        intersection: {
          itoi: [
            {
              state: "XX",
              county: "FULERTON",
              place: "NORCROSS",
              name: "London",
              type: "St",
              suffix: "SW"
            },
            {
              state: "ZZ",
              county: "COUNTY",
              place: "ATLANTA",
              name: "Jefferson",
              type: "Ave",
              suffix: "SW"
            }
          ]
        },
        well_known_text: "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
      }
    }
  end
end
