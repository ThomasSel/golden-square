require 'track'

RSpec.describe Track do
  it "creates a track with title and artist" do
    track_1 = Track.new("My title", "My artist")
    expect(track_1.matches?("title")).to eq true
  end

  it "creates a track with title and artist" do
    track_1 = Track.new("My title", "My artist")
    expect(track_1.matches?("artist")).to eq true
  end

  it "creates a track with title and artist" do
    track_1 = Track.new("My title", "My artist")
    expect(track_1.matches?("tart")).to eq false
  end
end