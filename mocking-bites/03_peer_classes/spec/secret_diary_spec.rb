require 'secret_diary'

RSpec.describe SecretDiary do

  context "diary starts off locked" do
    it "read raises an error" do
      diary = double(:diary)
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "we unlock the diary" do
    it "read returns the diary contents" do
      diary = double(:diary, read: "some contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "some contents"
    end
  end

  context "we unlock then lock the diary" do
    it "read raises an error" do
      diary = double(:diary)
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"    
    end
  end

  context "we unlock then lock then unlock the diary" do
    it "read returns the diary contents" do
      diary = double(:diary, read: "some contents")      
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      secret_diary.unlock
      expect(secret_diary.read).to eq "some contents"
    end
  end

end