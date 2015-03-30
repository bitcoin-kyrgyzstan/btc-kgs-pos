require 'rails_helper'

describe AmountAsIdentifier, '#encode' do
  let(:luid) { 1234 }

  subject { described_class.new(amount, luid).encode }

  context 'when amount has 8 digits after comma' do
    let(:amount) { 0.05177717 }

    it 'should swap last 4 digits with identifier' do
      is_expected.to eq "0.05171234"
    end
  end

  context 'when amount has less than 8 digits after comma' do
    let(:amount) { 0.05 }

    it 'should enlarge amount to 8 digits after comma and swap last 4 with identifier' do
      is_expected.to eq "0.05001234"
    end
  end
end
