require 'secret_diary'
require 'diary'

RSpec.describe 'integration of diaries' do

  context "diary starts off locked" do
    it "read raises an error" do
      diary = Diary.new("some contents")
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "we unlock the diary" do
    it "read returns the diary contents" do
      diary = Diary.new("some contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "some contents"
    end
  end

  context "we unlock then lock the diary" do
    it "rread raises an error" do
      diary = Diary.new("some contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"    
    end
  end

  context "we unlock then lock then unlock the diary" do
    it "read returns the diary contents" do
      diary = Diary.new("some contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      secret_diary.unlock
      expect(secret_diary.read).to eq "some contents"
    end
  end
end