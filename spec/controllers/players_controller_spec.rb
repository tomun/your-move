require 'spec_helper'

RSpec.describe PlayersController, type: :controller do

  let(:player) { create(:player) }
  let(:attributes) { attributes_for :player }

  describe "#new" do
    it "is successfull" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "changes count" do
      expect { post :create, player: attributes }.to change(Player, :count).by(1)
    end
  end

end
