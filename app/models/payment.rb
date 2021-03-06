class Payment < ActiveRecord::Base
  belongs_to :organization

  validates_presence_of :organization
  validates :luid, presence:   true,
                   uniqueness: true

  validates :btc_kgs_exchange_rate, presence: true

  before_validation :set_luid
  before_validation :set_btc_kgs_exchange_rate, on: :create

  def amount_in_btc
    CurrencyExchanger.new(amount_in_kgs).in_btc(btc_kgs_exchange_rate)
  end

  def amount_in_btc_with_identifier
    AmountAsIdentifier.new(amount_in_btc, luid).encode
  end

  def payment_request
    PaymentRequestGenerator.new(organization.bitcoin_address,
                                amount_in_btc_with_identifier).run
  end

  class << self
    def unique_luid
      while true
        luid = rand(9999)

        # TODO: search by luid only within pending payments
        return luid if find_by(luid: luid).nil?
      end
    end
  end

  def refresh_status_from_blockchain!
  end

  private

    def set_luid
      self.luid ||= self.class.unique_luid
    end

    def set_btc_kgs_exchange_rate
      self.btc_kgs_exchange_rate = CurrencyExchanger.btc_rate
    end
end
