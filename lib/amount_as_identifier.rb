class AmountAsIdentifier
  def initialize amount, identifier
    @amount = amount
    @identifier = identifier
  end

  attr_accessor :amount, :identifier

  def encode
    formatted_amount.sub /(\w{,#{identifier_size}})$/, identifier.to_s
  end

  private

    def identifier_size
      identifier.to_s.size
    end

    def formatted_amount
      format('%.8f', amount)
    end
end
