require 'rails_helper'

describe Payment, "before validation callback" do

  describe 'set luid' do
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

  describe 'set btc_kgs_exchange_rate' do
    subject { payment.save! }

    before { allow(CurrencyExchanger).to receive(:btc_rate).and_return 10000.0 }

    context 'when payment is new' do
      let(:payment) { build :payment, btc_kgs_exchange_rate: nil }

      it "should set btc rate" do
        expect { subject }.to change { payment.btc_kgs_exchange_rate }.from(nil).to(10000.0)
      end
    end

    context 'when payment is not new' do
      let!(:payment) { create :payment, btc_kgs_exchange_rate: 5.0 }

      it 'should not change btc rate' do
        expect { subject }.not_to change { payment.btc_kgs_exchange_rate }
      end
    end
  end
end
