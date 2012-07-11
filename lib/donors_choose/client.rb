module DonorsChooseApi
  class Client
    BASE_URL = "http://api.donorschoose.org"
    DEFAULT_KEY = "DONORSCHOOSE"

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def data_for(project_url, api_key=DEFAULT_KEY)
      response = @connection.get do |req|
        req.url '/common/json_feed.html'
        req.headers["Accepts"] = "application/json"
        req.params['id'] = grab_id_from_url(project_url)
        req.params['APIKEY'] = api_key
      end
      response.body
    end

    def get_id(donors_choose_id, api_key=DEFAULT_KEY)
      response = @connection.get do |req|
        req.url '/common/json_feed.html'
        req.headers["Accepts"] = "application/json"
        req.params['id'] = donors_choose_id
        req.params['APIKEY'] = api_key
      end
      response.body
    end

    def grab_id_from_url(project_url)
      project_url.scan(/\d{4,}/).first
    end
  end
end