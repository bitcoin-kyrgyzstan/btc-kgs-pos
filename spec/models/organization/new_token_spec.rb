require 'rails_helper'

describe Organization, "#new_token!" do

  subject { organization.new_token! }

  let!(:organization) { create :organization, token: "some_token" }

  before { allow(Organization).to receive(:unique_token).and_return "another_token" }

  it "should reset token" do
    expect { subject }.to change { organization.reload.token }.from("some_token").to "another_token"
  end

end