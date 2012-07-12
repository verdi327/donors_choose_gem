require 'spec_helper'

describe DonorsChooseApi::DonorsCountFetcher do
  SAMPLE_URL = "http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/"
  let(:project) { DonorsChooseApi::Project.find_by_url(SAMPLE_URL) }
  let(:sample_data) { File.open("spec/fixtures/sample_donors_choose_response.html") }

  describe '#make_connection(donors_choose_proposal_url)' do
    it 'returns a parsed nokogiri object' do
      project.make_connection(project.proposal_url).class.should be(Nokogiri::HTML::Document)
    end
  end

  before(:each) do
    project.stub(:make_connection).and_return(Nokogiri::HTML(sample_data))
  end

  describe '#donors_to_date(donors_choose_proposal_url = proposal_url)' do
    it 'returns a string' do
      project.donors_to_date.should be_a(String)
    end

    it 'returns zero if there are no donors' do
      project.donors_to_date.should == "0"
    end
  end
end