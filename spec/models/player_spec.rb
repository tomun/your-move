require 'spec_helper'

describe Player do

  let(:player) { create(:player) }

  it "has a valid factory" do
    expect(player).to be_valid
  end

end
