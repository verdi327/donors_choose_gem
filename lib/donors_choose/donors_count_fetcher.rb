module DonorsChooseApi
  module DonorsCountFetcher

    def donors_to_date
      unless make_connection(self.proposal_url).css('.needs.donors').any?
        "0"
      end
    end

    def make_connection(donors_choose_proposal_url)
      url = donors_choose_proposal_url
      Nokogiri.HTML(open(url))
    end
  end
end