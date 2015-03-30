class CurrencyExchanger
  FEE = 0.05.freeze

  def initialize amount_in_kgs
    @amount_in_kgs = amount_in_kgs
  end

  attr_accessor :amount_in_kgs

  def in_btc rate=nil
    rate ||= self.class.btc_rate

    amount_in_kgs / rate
  end

  class << self
    def btc_rate
      original_btc_rate + original_btc_rate * FEE
    end

    def original_btc_rate
      @original_btc_rate ||= Akchabar.btc_rate
    end
  end
end
