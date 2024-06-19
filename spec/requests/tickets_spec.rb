require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  before do
    @ticket = create(:ticket)
  end

  describe "Ticket Index" do
    it "returns a successful response" do
      get tickets_path
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      get tickets_path
      expect(response).to render_template(:index)
    end

    it "loads all tickets into @tickets" do
      get tickets_path
      expect(assigns(:tickets)).to match_array([ @ticket ])
    end
  end

  describe "Show Ticket" do
    it "shows the ticket" do
      get ticket_path(@ticket)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get ticket_path(@ticket)
      expect(response).to render_template(:show)
    end

    it "loads the correct ticket into @ticket" do
      get ticket_path(@ticket)
      expect(assigns(:ticket)).to eq(@ticket)
    end
  end
end
