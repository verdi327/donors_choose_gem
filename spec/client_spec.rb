require 'spec_helper'

describe DonorsChooseApi::Client do
  let(:client) { DonorsChooseApi::Client.new }
  SAMPLE_URL = "http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/"
  ID = 774020

  describe '#find_by_url(link_url, api_key)' do
    it 'returns a hash' do
      response = JSON.parse(client.find_by_url(SAMPLE_URL))
      response.should be_a(Hash)
    end

    context "confirming that the data is valid" do
      it 'returns a valid title' do
        response = JSON.parse(client.find_by_url(SAMPLE_URL))
        response['proposals'].first['title'] == "AppleTV Makes Classroom Tech iMazing"
      end
    end
  end
  describe "#find(id, api_key)" do
    it "returns a hash" do
      response = JSON.parse(client.find(ID))
    end
    context "confirming that the data is valid" do
      it 'returns a valid title' do
        response = JSON.parse(client.find_by_url(SAMPLE_URL))
        response['proposals'].first['title'] == "AppleTV Makes Classroom Tech iMazing"
      end
    end
  end

  describe '#grab_id_from_url(project_url)' do
    it 'returns the donors choose unique id from the url' do
      client.grab_id_from_url(SAMPLE_URL).should == "774020"
    end
  end

end