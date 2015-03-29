require 'rails_helper'

describe Payment do

  it { is_expected.to belong_to :organization }

end