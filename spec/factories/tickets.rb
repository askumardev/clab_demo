FactoryBot.define do
  factory :ticket do
    request_number { "MyString" }
    reference_request_number { "MyString" }
    version_number { 1 }
    sequence_number { 1 }
    request_type { "MyString" }
    request_action { "MyString" }
    request_taken_at { "2024-06-18 23:26:24" }
    legal_at { "2024-06-18 23:26:24" }
    response_due_at { "2024-06-18 23:26:24" }
    restake_at { "2024-06-18 23:26:24" }
    expiration_at { "2024-06-18 23:26:24" }
    primary_service_area_code { "MyString" }
    additional_service_area_codes { "MyText" }
    type_of_work { "MyString" }
    work_done_for { "MyString" }
    project_duration { "MyString" }
    project_start_date { "2024-06-18 23:26:24" }
    explosives { false }
    underground_overhead { "MyString" }
    horizontal_boring { "MyString" }
    whitelined { false }
    locate_instructions { "MyText" }
    remarks { "MyText" }
    digsite_info { "MyText" }
    well_known_text { "MyText" }
  end
end
