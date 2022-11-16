require 'music_library'
require 'track'

RSpec.describe "integration" do

  context "add two tracks" do
    it "all returns list of all tracks" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Title_1", "Artist_1")
      track_2 = Track.new("Title_2", "Artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "searches through tracks" do
    it "matches a keyword from the artist" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Title_1", "Arctic Monkeys")
      track_2 = Track.new("Title_10", "Arctic Monkeys")
      track_3 = Track.new("Title_100", "Arctic Monkeys")
      track_4 = Track.new("Title_1000", "The Monkeys")
      track_5 = Track.new("Title_2", "Artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      music_library.add(track_4)
      music_library.add(track_5)
      expect(music_library.search("Monkeys")).to eq [track_1,track_2,track_3,track_4]
    end

    it "matches a keyword from the title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Title_1", "Arctic Monkeys")
      track_2 = Track.new("Title_10", "Arctic Monkeys")
      track_3 = Track.new("Title_100", "Arctic Monkeys")
      track_4 = Track.new("Title_1000", "The Monkeys")
      track_5 = Track.new("Title_2", "Artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      music_library.add(track_4)
      music_library.add(track_5)
      expect(music_library.search("Title_1000")).to eq [track_4]
    end

    it "doesnt match any title or artist" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Title_1", "Arctic Monkeys")
      track_2 = Track.new("Title_10", "Arctic Monkeys")
      track_3 = Track.new("Title_100", "Arctic Monkeys")
      track_4 = Track.new("Title_1000", "The Monkeys")
      track_5 = Track.new("Title_2", "Artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      music_library.add(track_4)
      music_library.add(track_5)
      expect(music_library.search("example")).to eq []
    end
  end
end