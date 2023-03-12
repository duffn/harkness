# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::Error, vcr: true do
  let(:client) {
    Harkness::Client.new(
      public_key: ENV.fetch("MARVEL_PUBLIC_KEY", "abcd"),
      private_key: ENV.fetch("MARVEL_PRIVATE_KEY", "1234")
    )
  }

  before do
    Timecop.freeze(Time.utc(2023, 3, 9))
  end

  after do
    Timecop.return
  end

  it "returns an error with invalid parameters" do
    expect {
      client.comics.list(limit: 100_000)
    }.to raise_error(Harkness::Error::Conflict)
  end
end
