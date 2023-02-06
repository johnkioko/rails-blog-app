require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /view" do
    it "returns http success" do
      get "/posts/view"
      expect(response).to have_http_status(:success)
    end
  end

end
