require 'rails_helper'

describe Payment, '#amount_in_btc_with_identifier' do
  let(:payment) { create :payment }
  let(:amount_as_identifier) { double(AmountAsIdentifier) }

  before do
    allow(payment).to receive(:amount_in_btc).and_return(0.05)
    allow(payment).to receive(:luid).and_return(1234)
    allow(amount_as_identifier).to receive(:encode)
  end

  subject { payment.amount_in_btc_with_identifier }

  it 'should call for AmountAsIdentifier#encode with proper params' do
    expect(AmountAsIdentifier).to receive(:new).with(payment.amount_in_btc, payment.luid).and_return(amount_as_identifier)
    expect(amount_as_identifier).to receive(:encode)

    subject
  end
end
