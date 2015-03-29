require 'rails_helper'

describe Organization, "#unique_token" do

  subject { described_class.unique_token }

  it { is_expected.not_to be_empty }

  it "should return new token each time" do
    prev_token = described_class.unique_token
    expect(subject).not_to eq prev_token
  end

end