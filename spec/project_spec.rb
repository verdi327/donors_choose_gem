require 'spec_helper'

describe DonorsChooseApi::Project do
  SAMPLE_URL = "http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/"
  SAMPLE_ID = "811882"
  ATTR_HASH = { 'id' => SAMPLE_ID, 'fundURL' => 'http://foo.com', 'gradeLevel' => {'name' => 'Kindergarten'} }
  SAMPLE_JSON = { 'id' => SAMPLE_ID, 'fundURL' => 'http://foo.com', 'gradeLevel' => {'name' => 'Kindergarten'} }.to_json

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

  describe '.find_by_url(link_url, api_key)' do
   it 'returns an instance of the project class' do
     DonorsChooseApi::Project.find_by_url(SAMPLE_URL).should be_a(DonorsChooseApi::Project)
   end
  end

  describe '.find_by_id(donors_choose_id, api_key)' do
   it 'returns an instance of the project class' do
     DonorsChooseApi::Project.find_by_id(SAMPLE_ID).should be_a(DonorsChooseApi::Project)
   end
  end

  describe '#attributes' do
   it "returns a hash of the object's attributes" do
     project = DonorsChooseApi::Project.find_by_id(SAMPLE_ID)
     project.attributes.should be_a(Hash)
   end
  end

  describe '.new' do
    it "returns the correct values" do
      project = DonorsChooseApi::Project.new(ATTR_HASH)
      project.donors_choose_id.should == SAMPLE_ID
      project.grade_level.should == 'Kindergarten'
      project.fund_url.should == 'http://foo.com'
    end
  end
end