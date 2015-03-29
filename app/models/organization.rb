class Organization < ActiveRecord::Base
  TOKEN_LENGTH = 32.freeze

  validates :token, presence:   true,
                    uniqueness: true

  before_validation :set_token

  class << self
    def unique_token
      while true
        chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
        token = (0...TOKEN_LENGTH).collect { chars[Kernel.rand(chars.length)] }.join
        return token if find_by(token: token).nil?
      end
    end
  end

  def new_token!
    update token: self.class.unique_token
  end

  private

    def set_token
      self.token ||= self.class.unique_token
    end

end
