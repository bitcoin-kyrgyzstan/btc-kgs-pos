require 'rails_helper'

describe Payment, "before validation callback" do

  subject { payment.valid? }

  context "when payment has luid" do
    let(:payment) { build :payment, luid: nil }

    before { allow(Payment).to receive(:unique_luid).and_return "1234" }

    it "should set luid" do
      expect { subject }.to change(payment, :luid).from(nil).to("1234")
    end
  end

  context "when payment has no luid" do
    let(:payment) { build :payment, luid: "5678" }

    it "should not change luid" do
      expect { subject }.not_to change(payment, :luid).from "5678"
    end
  end
end
