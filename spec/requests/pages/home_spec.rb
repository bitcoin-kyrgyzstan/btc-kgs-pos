require 'rails_helper'

describe "GET /" do

  subject { get '/'; response }

  it { is_expected.to be_successful }

end