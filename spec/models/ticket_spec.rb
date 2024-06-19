require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should have_one(:excavator).dependent(:destroy) }

  it { should validate_presence_of(:request_number) }
end
