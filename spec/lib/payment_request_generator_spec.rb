require 'rails_helper'

describe PaymentRequestGenerator, '#run' do
  let(:store_address) { SecureRandom.hex }
  let(:amount) { 0.005 }

  subject { PaymentRequestGenerator.new(store_address, amount).run }

  it 'should generate payment request' do
    expect(subject).to eq "bitcoin://#{store_address}?amount=#{amount}"
  end
end
