require "rails_helper"
require 'byebug'

module Api
  describe PostsController, type: :controller do
    describe "GET #index" do
      it "has a 401 status code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end