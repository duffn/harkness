# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::CreatorResource, vcr: true do
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

  it "gets creators" do
    creators = client.creators.list
    expect(creators.data.results.length).to eq(20)
    expect(creators.data.results[0].firstName).to eq("#O")
  end

  it "gets creators with params" do
    creators = client.creators.list(limit: 1, nameStartsWith: "Ben")
    expect(creators.data.results.length).to eq(1)
    expect(creators.data.results[0].firstName).to eq("Bengal")
  end

  it "gets a creator by ID" do
    creator = client.creators.retrieve(creator_id: 8098)
    expect(creator.data.results.length).to eq(1)
    expect(creator.data.total).to eq(1)
    expect(creator.data.results[0].firstName).to eq("Bengal")
  end

  it "gets a creator's comics by ID" do
    comics = client.creators.comics(creator_id: 8098)
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(20)
    expect(comics.data.total).to eq(23)
    expect(comics.data.results[0].title).to eq("Spider-Gwen: Ghost-Spider Vol. 2 - Impossible Year (Trade Paperback)")
  end

  it "gets a creator's events by ID" do
    events = client.creators.events(creator_id: 4994)
    expect(events.data.results[0].class).to eq(Harkness::Event)
    expect(events.data.results.length).to eq(4)
    expect(events.data.total).to eq(4)
    expect(events.data.results[0].title).to eq("Age of Ultron")
  end

  it "gets a creator's series by ID" do
    series = client.creators.series(creator_id: 8098)
    expect(series.data.results[0].class).to eq(Harkness::Series)
    expect(series.data.results.length).to eq(9)
    expect(series.data.total).to eq(9)
    expect(series.data.results[0].title).to eq("All-New Wolverine (2015 - 2018)")
  end

  it "gets a creator's stories by ID" do
    stories = client.creators.stories(creator_id: 8098)
    expect(stories.data.results[0].class).to eq(Harkness::Story)
    expect(stories.data.results.length).to eq(20)
    expect(stories.data.total).to eq(25)
    expect(stories.data.results[0].title).to eq("cover from Avengers (2012) #34.2")
  end
end
