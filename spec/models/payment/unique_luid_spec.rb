require 'rails_helper'

describe Payment, ".unique_luid" do

  subject { described_class.unique_luid }

  it { is_expected.to be_present }

  it "should return new luid each time" do
    prev_luid = described_class.unique_luid
    expect(subject).not_to eq prev_luid
  end
end
