class Api::V1::TicketsController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    Rails.logger.debug "Ticket Params: #{ticket_params.inspect}"
    @ticket = Ticket.new(ticket_params.except(:excavator_attributes))
    @ticket.build_excavator(ticket_params[:excavator_attributes])
    if @ticket.save
      render json: @ticket, status: :created
    else
      Rails.logger.debug "Ticket Errors: #{@ticket.errors.full_messages}"
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(
      :request_number, :reference_request_number, :version_number,
      :sequence_number, :request_type, :request_action, :request_taken_at, :legal_at,
      :response_due_at, :restake_at, :expiration_at, :primary_service_area_code,
      :type_of_work, :work_done_for, :project_duration, :project_start_date,
      :explosives, :underground_overhead, :horizontal_boring, :whitelined,
      :locate_instructions, :remarks, :well_known_text,
      digsite_info: [
        :lookup_by, :location_type,
        address_info: [
          :state, :county, :place,
          address: [ :address_num ],
          street: [ :prefix, :name, :type, :suffix ]
        ],
        near_street: [ :state, :county, :place ],
        intersection: [
          itoi: [ :state, :county, :place, :name, :type, :suffix ]
        ]
      ],
      additional_service_area_codes: [],
      excavator_attributes: [
        :company_name, :address, :city, :state, :zip, :excavator_type,
        :contact_name, :contact_phone, :contact_email, :field_contact_name,
        :field_contact_phone, :field_contact_email, :crew_onsite
      ]
    )
  end
end
