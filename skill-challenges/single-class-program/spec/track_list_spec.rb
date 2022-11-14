require "track_list"

RSpec.describe TrackList do
  context "After initializing" do
    it "view_tracks returns an empty list" do
      track_list = TrackList.new
      expect(track_list.view_tracks).to eq []
    end
  end

  context "Adding one track" do
    it "returns a list with the track we added" do
      track_list = TrackList.new
      track_list.add("track_1")
      expect(track_list.view_tracks).to eq ["track_1"]
    end
  end

  context "Adding two tracks" do
    it "returns a list with the tracks we added" do
      track_list = TrackList.new
      track_list.add("track_1")
      track_list.add("track_2")
      expect(track_list.view_tracks).to eq ["track_1", "track_2"]
    end
  end

  it "fails when trying to add an empty string as a track name" do
    track_list = TrackList.new
    expect { track_list.add("") }.to raise_error "Cannot add empty string as track"
  end
end