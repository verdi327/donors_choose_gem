module DonorsChooseApi
  class Client
    BASE_URL = "http://api.donorschoose.org"
    DEFAULT_KEY = "DONORSCHOOSE"

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def query(id, api_key=DEFAULT_KEY)
      response = @connection.get do |req|
        req.url '/common/json_feed.html'
        req.headers["Accepts"] = "application/json"
        req.params['id'] = id
        req.params['APIKEY'] = api_key
      end
      response.body
    end

    def grab_id_from_url(project_url)
      project_url.scan(/\d{4,}/).first
    end

    def find_by_url(url, api_key=nil)
      query(grab_id_from_url(url), api_key)
    end

    def find(id,api_key=nil)
      query(id,api_key)
    end
  end
end