require 'rails_helper'

describe Organization, "before validation callback" do

  subject { organization.valid? }

  context "when organization has token" do
    let(:organization) { build :organization, token: nil }

    before { allow(Organization).to receive(:unique_token).and_return "azaza" }

    it "should set token" do
      expect { subject }.to change(organization, :token).from(nil).to("azaza")
    end
  end

  context "when organization has no token" do
    let(:organization) { build :organization, token: "ololo" }

    it "should not change token" do
      expect { subject }.not_to change(organization, :token).from "ololo"
    end
  end
end