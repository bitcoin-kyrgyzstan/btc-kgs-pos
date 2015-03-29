class Payment < ActiveRecord::Base
  belongs_to :organization

  validates_presence_of :organization
  validates :luid, presence:   true,
                   uniqueness: true

  before_validation :set_luid

  class << self
    def unique_luid
      while true
        luid = rand(9999)
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
end
