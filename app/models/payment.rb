class Payment < ActiveRecord::Base

  validates_presence_of :organization

  belongs_to :organization

end
