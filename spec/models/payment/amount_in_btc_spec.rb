require 'rails_helper'

describe Payment, '#amount_in_btc' do
  let(:payment) { create :payment, btc_kgs_exchange_rate: 15000.0 }
  let(:currency_exchanger) { double }

  before do
    allow(currency_exchanger).to receive(:in_btc).with(payment.btc_kgs_exchange_rate)
  end

  subject { payment.amount_in_btc }

  it 'should call for CurrencyExchanger#in_btc' do
    expect(CurrencyExchanger).to receive(:new).with(payment.amount_in_kgs).and_return(currency_exchanger)
    expect(currency_exchanger).to receive(:in_btc).with(payment.btc_kgs_exchange_rate)

    subject
  end
end
