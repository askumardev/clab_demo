require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { Ticket.new(request_number: '12345678') }

  describe 'Validation' do
    it { should have_one(:excavator).dependent(:destroy) }

    it { should validate_presence_of(:request_number) }

    context 'when request_number is not unique' do
      before { described_class.create!(request_number: '12345678') }
      it { expect(subject).to be_invalid }
    end

    context 'when request_number is  unique' do
      before { described_class.create!(request_number: '123456789') }
      it { expect(subject).to be_valid }
    end
  end
end
