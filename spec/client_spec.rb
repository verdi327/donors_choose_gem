require 'spec_helper'

describe DonorsChooseApi::Client do
  let(:client) { DonorsChooseApi::Client.new }
  SAMPLE_URL = "http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/"
  SAMPLE_ID = "811882"

  describe '#data_for(link_url, api_key)' do
    it 'returns a hash' do
      response = JSON.parse(client.data_for(SAMPLE_URL))
      response.should be_a(Hash)
    end

    context "confirming that the data is valid" do
      it 'returns a valid title' do
        response = JSON.parse(client.data_for(SAMPLE_URL))
        response['proposals'].first['title'] == "AppleTV Makes Classroom Tech iMazing"
      end
    end
  end

  describe '#grab_id_from_url(project_url)' do
    it 'returns the donors choose unique id from the url' do
      client.grab_id_from_url(SAMPLE_URL).should == "774020"
    end
  end

  describe '.get_id(donors_choose_id, api_key)' do
    it 'returns a hash' do
      response = JSON.parse(client.get_id(SAMPLE_ID))
      response.should be_a(Hash)
    end
  end

end