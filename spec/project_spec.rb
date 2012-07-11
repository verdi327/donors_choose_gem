require 'spec_helper'

describe DonorsChooseApi::Project do
  SAMPLE_URL = "http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/"
  SAMPLE_JSON = { 'a' => 'dog', 'b' => 'cat', 'c' => 'john' }.to_json
  ID = 774020
  describe '.client' do
    it 'creates an instance of the DonorsChooseApi::Client class' do
      DonorsChooseApi::Project.client.should be_a(DonorsChooseApi::Client)
    end
  end

  describe '.parse(link_url)' do
    it 'returns a hash from a json object' do
      DonorsChooseApi::Project.parse(SAMPLE_JSON).should be_a(Hash)
    end
  end

  describe '.find_by_url(link_url)' do
    it 'returns an instance of the project class' do
      DonorsChooseApi::Project.find_by_url(SAMPLE_URL).should be_a(DonorsChooseApi::Project)
    end
  end
  describe '.find(id)' do
    it 'returns an instance of the project class' do
      DonorsChooseApi::Project.find(ID).should be_a(DonorsChooseApi::Project)
    end
  end
end