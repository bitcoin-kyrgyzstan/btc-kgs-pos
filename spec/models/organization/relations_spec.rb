require 'rails_helper'

describe Organization do

  it { is_expected.to have_many :payments }

end