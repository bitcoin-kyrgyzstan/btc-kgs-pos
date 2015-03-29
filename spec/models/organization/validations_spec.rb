require 'rails_helper'

describe Organization do

  before { allow_any_instance_of(Organization).to receive :set_token }

  it { is_expected.to validate_presence_of :token }
  it { is_expected.to validate_uniqueness_of :token }

  it "should have valid factory" do
    expect(build :organization).to be_valid
  end

end