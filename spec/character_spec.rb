# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::CharacterResource, vcr: true do
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

  it "gets characters" do
    characters = client.characters.list
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(20)
    expect(characters.data.results[0].name).to eq("3-D Man")
  end

  it "gets characters with params" do
    characters = client.characters.list(limit: 1, nameStartsWith: "Spider")
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(1)
    expect(characters.data.results[0].name).to eq("Spider-dok")
  end

  it "gets a character by ID" do
    character = client.characters.retrieve(character_id: 1_011_334)
    expect(character.data.results[0].class).to eq(Harkness::Character)
    expect(character.data.results.length).to eq(1)
    expect(character.data.total).to eq(1)
    expect(character.data.results[0].name).to eq("3-D Man")
  end

  it "gets a character's comics by ID" do
    comics = client.characters.comics(character_id: 1_011_334)
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(12)
    expect(comics.data.total).to eq(12)
    expect(comics.data.results[0].title).to eq("Avengers: The Initiative (2007) #19")
  end

  it "gets a character's events by ID" do
    events = client.characters.events(character_id: 1_011_334)
    expect(events.data.results[0].class).to eq(Harkness::Event)
    expect(events.data.results.length).to eq(1)
    expect(events.data.total).to eq(1)
    expect(events.data.results[0].title).to eq("Secret Invasion")
  end

  it "gets a character's series by ID" do
    series = client.characters.series(character_id: 1_011_334)
    expect(series.data.results[0].class).to eq(Harkness::Series)
    expect(series.data.results.length).to eq(3)
    expect(series.data.total).to eq(3)
    expect(series.data.results[0].title).to eq("Avengers: The Initiative (2007 - 2010)")
  end

  it "gets a character's stories by ID" do
    stories = client.characters.stories(character_id: 1_009_178)
    expect(stories.data.results[0].class).to eq(Harkness::Story)
    expect(stories.data.results.length).to eq(1)
    expect(stories.data.total).to eq(1)
    expect(stories.data.results[0].title).to eq("Fresh Upstart")
  end
end
