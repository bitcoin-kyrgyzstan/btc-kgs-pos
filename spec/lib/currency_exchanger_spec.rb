require 'rails_helper'

describe CurrencyExchanger do
  describe '#in_btc' do
    let(:amount_in_kgs) { 100 }

    context 'when rate is not passed' do
      before { allow(Akchabar).to receive(:btc_rate).and_return(BigDecimal.new(10000)) }

      subject { described_class.new(amount_in_kgs).in_btc }

      it 'should convert to BTC according to rate with Fee' do
        expect(subject.to_f).to eq (0.009523809523809525).to_f
      end
    end

    context 'when rate is passed' do
      subject { described_class.new(amount_in_kgs).in_btc(20000.0) }

      it 'should convert to BTC according to rate with Fee' do
        expect(subject.to_f).to eq (0.005).to_f
      end
    end
  end

  describe '.btc_rate' do
    before { allow(Akchabar).to receive(:btc_rate).and_return(BigDecimal.new(10000)) }

    subject { described_class.btc_rate }

    it 'should return BTC rate with Fee' do
      expect(subject).to eq 10500.0
    end
  end

  describe '.original_btc_rate' do
    before { allow(Akchabar).to receive(:btc_rate).and_return(BigDecimal.new(10000)) }

    subject { described_class.original_btc_rate }

    it 'should return original BTC rate' do
      expect(subject).to eq 10000.0
    end
  end
end
