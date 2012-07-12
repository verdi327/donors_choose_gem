module DonorsChooseApi
  module DonorsCountFetcher

    def donors_to_date(donors_choose_proposal_url = proposal_url)
      make_connection(donors_choose_proposal_url).css('.needs.donors').children[1].text
    end

    def make_connection(donors_choose_proposal_url)
      url = donors_choose_proposal_url
      Nokogiri.HTML(open(url))
    end
  end
end