require 'spec_helper'

describe "creating a session" do
  context "before signing in" do
    it "has certain links" do
      visit "/"
      expect(page).to have_link "Home"
      expect(page).to have_link "Login"
      expect(page).to have_link "Register"
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

  end
end
