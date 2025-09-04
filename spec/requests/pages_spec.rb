require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let(:user) do
    User.create!(email: "user_pages_#{SecureRandom.hex(4)}@example.com", password: "password")
  end

  let!(:todo) { user.todos.create!(text: "Water the plants") }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end
  describe "GET /" do
    it "returns todos for the current user" do
      get root_path
      expect(response.body).to include("Water the plants")
      expect(response).to have_http_status(:ok)
    end
  end
end
