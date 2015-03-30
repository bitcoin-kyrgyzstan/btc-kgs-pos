require 'rails_helper'

describe Payment, '#payment_request' do
  let(:organization) { create :organization, bitcoin_address: SecureRandom.hex }
  let(:payment) { create :payment, organization: organization }
  let(:payment_request_generator) { double(PaymentRequestGenerator) }

  before do
    allow(payment).to receive(:amount_in_btc_with_identifier).and_return("0.05001234")
    allow(payment_request_generator).to receive(:run)
  end

  subject { payment.payment_request }

  it 'should call PaymentRequestGenerator.new with proper params and #run' do
    expect(PaymentRequestGenerator).to receive(:new).
                                        with(organization.bitcoin_address,
                                             payment.amount_in_btc_with_identifier).
                                        and_return(payment_request_generator)
    expect(payment_request_generator).to receive(:run)

    subject
  end
end
