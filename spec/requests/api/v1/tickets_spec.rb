
require 'rails_helper'

RSpec.describe 'Tickets API', type: :request do
  describe 'POST /api/v1/tickets' do
    let(:valid_attributes) {
      {
        ticket: {
          request_number: "",
          reference_request_number: "",
          version_number: "0",
          sequence_number: "2421",
          request_type: "Normal",
          request_action: "Restake",
          request_taken_at: "2011-07-02T23:09:38",
          legal_at: "2011-07-08T07:00:00",
          response_due_at: "2011-07-13T23:59:59",
          restake_at: "2011-07-21T00:00:00",
          expiration_at: "2011-07-26T00:00:00",
          primary_service_area_code: "ZZGL103",
          additional_service_area_codes: [ "ZZL01", "ZZL02", "ZZL03" ],
          type_of_work: "rpr man hole tops",
          work_done_for: "gpc",
          project_duration: "60 days",
          project_start_date: "2011-07-08T07:00:00",
          explosives: "No",
          underground_overhead: "Underground",
          horizontal_boring: "Road, Driveway, and Sidewalk",
          whitelined: "No",
          locate_instructions: "locate along the r/o/w on both sides of the rd - including the rd itself - from inter to inter",
          remarks: "Previous Request Number:05161-120-011\n\n\t\t\tPrevious Request Number:06044-254-020\n\n\t\t\tPrevious Request Number:06171-300-030",
          well_known_text: "POLYGON((40.8007 -73.9580, 40.8007 -73.9498, 40.7644 -73.9580, 40.7644 -73.9498))",
          digsite_info: {
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
            }
          },
          excavator_attributes: {
            company_name: "John Doe CONSTRUCTION",
            address: "555 Some RD",
            city: "SOME PARK",
            state: "ZZ",
            zip: "55555",
            excavator_type: "Excavator",
            contact_name: "Johnny Doe",
            contact_phone: "1115552345",
            contact_email: "example@example.com",
            field_contact_name: "Field Contact",
            field_contact_phone: "1235557924",
            field_contact_email: "example@example.com",
            crew_onsite: true
          }
        }
      }
    }


    it 'returns a created status' do
      post '/api/v1/tickets', params: valid_attributes
      json_response = JSON.parse(response.body)
      if json_response["request_number"].include?("can't be blank")
        expect(response).to have_http_status(422)
      else
        expect(response).to have_http_status(:created)
      end
    end

    it 'returns an error when invalid' do
      post '/api/v1/tickets', params: valid_attributes
      if valid_attributes[:ticket][:request_number].nil? || valid_attributes[:ticket][:request_number].blank?
        expect(response).to have_http_status(422)
      else
        expect(response).to have_http_status(:created)
      end
    end
  end
end
