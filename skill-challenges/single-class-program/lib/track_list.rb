class TrackList
  def initialize
    @list = []
  end
  
  def add(track)
    fail "Cannot add empty string as track" if track.empty?

    @list << track
  end
  
  def view_tracks
    return @list
  end
end