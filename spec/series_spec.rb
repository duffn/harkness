# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::SeriesResource, vcr: true do
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

  it "gets series" do
    series = client.series.list
    expect(series.data.results.length).to eq(20)
    expect(series.data.results[0].title).to eq(" Fantastic Four by Dan Slott Vol. 1 (2021)")
  end

  it "gets series with params" do
    series = client.series.list(limit: 1, titleStartsWith: "160")
    expect(series.data.results.length).to eq(1)
    expect(series.data.results[0].title).to eq("1602 (2003 - 2004)")
  end

  it "gets a series by ID" do
    series = client.series.retrieve(series_id: 19_244)
    expect(series.data.results.length).to eq(1)
    expect(series.data.total).to eq(1)
    expect(series.data.results[0].title).to eq("1602 Witch Hunter Angela (2015)")
  end

  it "gets a series' comics by ID" do
    comics = client.series.comics(series_id: 18_454)
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(5)
    expect(comics.data.total).to eq(5)
    expect(comics.data.results[0].title).to eq("100th Anniversary Special (2014) #1")
  end

  it "gets a series' events by ID" do
    events = client.series.events(series_id: 2116)
    expect(events.data.results[0].class).to eq(Harkness::Event)
    expect(events.data.results.length).to eq(3)
    expect(events.data.total).to eq(3)
    expect(events.data.results[0].title).to eq("Acts of Vengeance!")
  end

  it "gets a series' stories by ID" do
    stories = client.series.stories(series_id: 18_454)
    expect(stories.data.results[0].class).to eq(Harkness::Story)
    expect(stories.data.results.length).to eq(10)
    expect(stories.data.total).to eq(10)
    expect(stories.data.results[0].title).to eq("cover from 100th Anniversary Special (2014) #1")
  end

  it "gets a series' characters by ID" do
    characters = client.series.characters(series_id: 454)
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(20)
    expect(characters.data.total).to eq(147)
    expect(characters.data.results[0].name).to eq("Annihilus")
  end

  it "gets a series' creators by ID" do
    creators = client.series.creators(series_id: 18_454)
    expect(creators.data.results[0].class).to eq(Harkness::Creator)
    expect(creators.data.results.length).to eq(5)
    expect(creators.data.total).to eq(5)
    expect(creators.data.results[0].firstName).to eq("Andy")
  end
end
