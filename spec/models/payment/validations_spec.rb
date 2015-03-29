require 'rails_helper'

describe Payment do

  it { is_expected.to validate_presence_of :organization }

  it "should have valid factory" do
    expect(build :payment).to be_valid
  end

end