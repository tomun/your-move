require 'spec_helper'

describe User, type: :model do

  let(:user) { create(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end
end
