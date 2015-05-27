require 'spec_helper'

RSpec.describe GamesController, type: :controller do

  let(:game) { create(:game) }
  let(:attributes) { attributes_for :game }

  describe "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "is successful" do
      expect {
       post :create, game: attributes
      }.to change(Game, :count).by(1)
    end
  end

  describe "#destroy" do
    it "is successful" do
      post :create, game: attributes

      expect {
       delete :destroy, id: Game.last.id
      }.to change(Game, :count).by(-1)
    end
  end

  describe "#index" do
    it "is successful" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "is successful" do
      post :create, game: attributes

      get :show, id: Game.last.id
      expect(response).to render_template(:show)
    end
  end

  describe "#move" do
    it "is successful" do      
      get :move, { id: game.id, row: 0, col: 0 }

      expect(response).to render_template(:show)
    end
  end

end
