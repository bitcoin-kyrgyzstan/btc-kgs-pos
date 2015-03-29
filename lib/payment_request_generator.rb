class PaymentRequestGenerator

  def initialize address, amount
    @address = address
    @amount = amount
  end

  attr_accessor :address, :amount

  def run
    [scheme, address, amount_string].join
  end

  private

    def amount_string
      "?amount=#{amount}"
    end

    def scheme
      "bitcoin://"
    end
end
