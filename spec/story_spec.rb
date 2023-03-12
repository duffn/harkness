# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::StoryResource, vcr: true do
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

  it "gets stories" do
    stories = client.stories.list
    expect(stories.data.results.length).to eq(20)
    expect(stories.data.results[0].title).to eq("Investigating the murder of a teenage girl, Cage suddenly learns "\
      "that a three-way gang war is under way for control of the turf")
  end

  it "gets stories with params" do
    stories = client.stories.list(limit: 1, comics: "1332")
    expect(stories.data.results.length).to eq(1)
    expect(stories.data.results[0].title).to eq("Days of Future Past")
  end

  it "gets a story by ID" do
    stories = client.stories.retrieve(story_id: 11)
    expect(stories.data.results.length).to eq(1)
    expect(stories.data.total).to eq(1)
    expect(stories.data.results[0].title).to eq("Interior #11")
  end

  it "gets a story's characters by ID" do
    characters = client.stories.characters(story_id: 1315)
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(5)
    expect(characters.data.total).to eq(5)
    expect(characters.data.results[0].name).to eq("Carnage (Ultimate)")
  end

  it "gets a story's creators by ID" do
    creators = client.stories.creators(story_id: 25_655)
    expect(creators.data.results[0].class).to eq(Harkness::Creator)
    expect(creators.data.results.length).to eq(1)
    expect(creators.data.total).to eq(1)
    expect(creators.data.results[0].firstName).to eq("#O")
  end

  it "gets a story's events by ID" do
    events = client.stories.events(story_id: 12_960)
    expect(events.data.results[0].class).to eq(Harkness::Event)
    expect(events.data.results.length).to eq(1)
    expect(events.data.total).to eq(1)
    expect(events.data.results[0].title).to eq("Acts of Vengeance!")
  end

  it "gets a story's series by ID" do
    series = client.stories.series(story_id: 30)
    expect(series.data.results[0].class).to eq(Harkness::Series)
    expect(series.data.results.length).to eq(1)
    expect(series.data.total).to eq(1)
    expect(series.data.results[0].title).to eq("Essential Incredible Hulk Vol. II (1999)")
  end

  it "gets a story's comics by ID" do
    comics = client.stories.comics(story_id: 30)
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(1)
    expect(comics.data.total).to eq(1)
    expect(comics.data.results[0].title).to eq("Essential Incredible Hulk Vol. II (Trade Paperback)")
  end
end
