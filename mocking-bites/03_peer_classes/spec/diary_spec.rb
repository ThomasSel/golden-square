require 'diary'

RSpec.describe Diary do
  it "returns diary contents" do
    diary = Diary.new("some other contents")
    expect(diary.read).to eq "some other contents"
  end

  it "returns diary contents" do
    diary = Diary.new("some other contents but more")
    expect(diary.read).to eq "some other contents but more"
  end
end