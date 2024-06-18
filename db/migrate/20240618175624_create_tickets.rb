class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :reference_request_number
      t.integer :version_number
      t.integer :sequence_number
      t.string :request_type
      t.string :request_action
      t.datetime :request_taken_at
      t.datetime :legal_at
      t.datetime :response_due_at
      t.datetime :restake_at
      t.datetime :expiration_at
      t.string :primary_service_area_code
      t.text :additional_service_area_codes
      t.string :type_of_work
      t.string :work_done_for
      t.string :project_duration
      t.datetime :project_start_date
      t.boolean :explosives
      t.string :underground_overhead
      t.string :horizontal_boring
      t.boolean :whitelined
      t.text :locate_instructions
      t.text :remarks
      t.text :digsite_info
      t.text :well_known_text

      t.timestamps
    end
  end
end
