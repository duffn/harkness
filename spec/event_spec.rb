# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::EventResource, vcr: true do
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

  it "gets events" do
    events = client.events.list
    expect(events.data.results.length).to eq(20)
    expect(events.data.results[0].title).to eq("Acts of Vengeance!")
  end

  it "gets events with params" do
    events = client.events.list(limit: 1, nameStartsWith: "Age")
    expect(events.data.results.length).to eq(1)
    expect(events.data.results[0].title).to eq("Age of Apocalypse")
  end

  it "gets a event by ID" do
    event = client.events.retrieve(event_id: 227)
    expect(event.data.results.length).to eq(1)
    expect(event.data.total).to eq(1)
    expect(event.data.results[0].title).to eq("Age of Apocalypse")
  end

  it "gets a event's comics by ID" do
    comics = client.events.comics(event_id: 227)
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(20)
    expect(comics.data.total).to eq(50)
    expect(comics.data.results[0].title).to eq("X-Men: The Complete Age of Apocalypse Epic Book 4 (Trade Paperback)")
  end

  it "gets a event's series by ID" do
    series = client.events.series(event_id: 227)
    expect(series.data.results[0].class).to eq(Harkness::Series)
    expect(series.data.results.length).to eq(20)
    expect(series.data.total).to eq(20)
    expect(series.data.results[0].title).to eq("Age of Apocalypse: The Chosen (1995)")
  end

  it "gets a event's stories by ID" do
    stories = client.events.stories(event_id: 227)
    expect(stories.data.results[0].class).to eq(Harkness::Story)
    expect(stories.data.results.length).to eq(20)
    expect(stories.data.total).to eq(197)
    expect(stories.data.results[0].title).to eq("X-Men Chronicles 1-2; Tales from the AOA: By the Light")
  end

  it "gets a events's characters by ID" do
    characters = client.events.characters(event_id: 227)
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(20)
    expect(characters.data.total).to eq(91)
    expect(characters.data.results[0].name).to eq("Abyss")
  end

  it "gets a events's creators by ID" do
    creators = client.events.creators(event_id: 227)
    expect(creators.data.results[0].class).to eq(Harkness::Creator)
    expect(creators.data.results.length).to eq(20)
    expect(creators.data.total).to eq(111)
    expect(creators.data.results[0].firstName).to eq("Comicraft")
  end
end
