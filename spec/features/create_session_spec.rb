require 'spec_helper'

describe "creating a session" do
  context "before signing in" do
    before do
      visit "/"
    end

    it "has certain links" do
      expect(page).to have_link "Home"
      expect(page).to have_link "Login"
      expect(page).to have_link "Register"
    end

    it "tells the user to Login or Register" do
      expect(page).to have_content "Login or Register to start playing"
    end
  end

  context "after signing in" do
    let(:player) { create(:player) }

    before do
      login_as player
    end

    it "has certain links" do
      expect(page).to have_link "Home"
      expect(page).to have_link "Logout"
    end

    it "welcomes the user by name" do
      expect(page).to have_content "Welcome #{player.handle}"
    end

  end
end
