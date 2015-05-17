require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  let(:player) { Player.create!(handle: 'test', email: 'test@test.com', password: "Password",
                            password_confirmation: "Password")
  }

  # no new vieews/sessions/new.html.erb exists yet 
  # describe "#new" do
  #   it "is successful" do
  #     get :new
  #     expect(response).to be_success
  #   end
  # end

  context "with valid credentials" do
    describe "#create" do
      it "adds a Player session" do
        post :create, login_handle: player.handle, login_password: player.password
        expect(session[:player_id]).to eq player.id
      end
    end
  end

  context "with invalid credentials" do
    describe "#create" do
      it "flashes an error message" do
        post :create, login_handle: player.handle, login_password: "bogus password"
        expect(flash[:error]).to include("incorrect")
      end
    end
  end

  describe "#destroy" do

    before do
      post :create, login_handle: player.handle, login_password: player.password
      delete :destroy
    end

    it "deletes a Player session" do
      expect(session[:player_id]).to be_nil
    end

    it "redirects to root_url" do
      expect(response).to redirect_to(root_url)
    end

    it "has flash notice" do
      expect(flash[:notice]).to eq "You have been logged out."
    end
  end

end
