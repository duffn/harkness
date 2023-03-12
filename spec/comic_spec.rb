# frozen_string_literal: true

require "spec_helper"
require "timecop"

RSpec.describe Harkness::ComicResource, vcr: true do
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

  it "gets comics" do
    comics = client.comics.list
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(20)
    expect(comics.data.results[0].title).to eq("Marvel Previews (2017)")
  end

  it "gets comics with params" do
    comics = client.comics.list(limit: 1, titleStartsWith: "Spider")
    expect(comics.data.results[0].class).to eq(Harkness::Comic)
    expect(comics.data.results.length).to eq(1)
    expect(comics.data.results[0].title).to eq("Spider-Man (2016) #6 (Anka Mighty Men Variant)")
  end

  it "gets a comic by ID" do
    comic = client.comics.retrieve(comic_id: 1332)
    expect(comic.data.results[0].class).to eq(Harkness::Comic)
    expect(comic.data.results.length).to eq(1)
    expect(comic.data.total).to eq(1)
    expect(comic.data.results[0].title).to eq("X-Men: Days of Future Past (Trade Paperback)")
  end

  it "gets a comic's characters by ID" do
    characters = client.comics.characters(comic_id: 1332)
    expect(characters.data.results[0].class).to eq(Harkness::Character)
    expect(characters.data.results.length).to eq(10)
    expect(characters.data.total).to eq(10)
    expect(characters.data.results[0].name).to eq("Archangel")
  end

  it "gets a comic's creators by ID" do
    creators = client.comics.creators(comic_id: 17_701)
    expect(creators.data.results[0].class).to eq(Harkness::Creator)
    expect(creators.data.results.length).to eq(16)
    expect(creators.data.total).to eq(16)
    expect(creators.data.results[0].firstName).to eq("Terry")
  end

  it "gets a comic's events by ID" do
    events = client.comics.events(comic_id: 17_701)
    expect(events.data.results[0].class).to eq(Harkness::Event)
    expect(events.data.results.length).to eq(1)
    expect(events.data.total).to eq(1)
    expect(events.data.results[0].title).to eq("Age of Apocalypse")
  end

  it "gets a comic's stories by ID" do
    stories = client.comics.stories(comic_id: 1332)
    expect(stories.data.results[0].class).to eq(Harkness::Story)
    expect(stories.data.results.length).to eq(3)
    expect(stories.data.total).to eq(3)
    expect(stories.data.results[0].title).to eq("Days of Future Past")
  end
end
