require 'spec_helper'

describe "creating a player" do
  context "with valid params" do

    before do
      visit "/players/new"
      fill_in "Handle", with: "test"
      fill_in "Email", with: "test@test.com"
      fill_in "player_password", with: "Password"
      fill_in "player_password_confirmation", with: "Password"
      click_button "Submit"
    end

    it "tells the player they have signed up" do
      expect(page).to have_content "You have signed up"
    end

    it "sends them to their dashboard" do
      expect(current_path).to eq "/dashboard"
    end
  end

  context "with invalid params" do

    before do
      visit "/players/new"
      fill_in "Handle", with: "test"
      fill_in "Email", with: "test@test.com"
      fill_in "player_password", with: "Password"
      fill_in "player_password_confirmation", with: "NOPE"
      click_button "Submit"
    end

    it "tells the player they made a mistake" do
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
