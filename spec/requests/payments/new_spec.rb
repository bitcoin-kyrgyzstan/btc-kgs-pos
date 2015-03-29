require 'rails_helper'

describe "GET /payments/new" do
  subject { get new_payment_path(params); response }

  context "when organization is authenticated" do
    let(:params) { { token: create(:organization).token } }

    it { is_expected.to be_successful }

  end

  context "when organization is unauthenticated" do
    let(:params) { {} }

    it { is_expected.to redirect_to('/') }

  end

end