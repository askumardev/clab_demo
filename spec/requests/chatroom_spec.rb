require 'rails_helper'

RSpec.describe "Chatrooms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/chatroom/index"
      expect(response).to have_http_status(:success)
    end
  end

end
