module DonorsChooseApi
  class Project < DonorsChooseApi::ApiBaseModel
    include DonorsCountFetcher
    DEFAULT_KEY = "DONORSCHOOSE"

    field :donors_choose_id, :key    => 'id'
    field :proposal_url, :key        => 'proposalURL'
    field :fund_url, :key            => 'fundURL'
    field :image_url, :key           => 'imageURL'
    field :title, :key               => 'title'
    field :short_description, :key   => 'shortDescription'
    field :fulfillment_trailer, :key => 'fulfillmentTrailer'
    field :percent_funded, :key      => 'percentFunded'
    field :cost_to_complete, :key    => 'costToComplete'
    field :total_price, :key         => 'totalPrice'
    field :free_shipping, :key       => 'freeShipping'
    field :teacher_name, :key        => 'teacherName'
    field :poverty_level, :key       => 'povertyLevel'
    field :school_name, :key         => 'schoolName'
    field :city, :key                => 'city'
    field :state_abbr, :key          => 'state'
    field :zip, :key                 => 'zip'
    field :latitude, :key            => 'latitude'
    field :longitude, :key           => 'longitude'
    field :expiration_date, :key     => 'expirationDate'
    field :funding_status, :key      => 'fundingStatus'
    field(:grade_level, :key         => 'gradeLevel') { |grade_hash| @grade_level = grade_hash['name'] if grade_hash }
    field(:subject, :key             => 'subject')    { |subject_hash| @subject = subject_hash['name'] if subject_hash }
    field(:resource_type, :key       => 'resource')   { |resource_hash| @resource_type = resource_hash['name'] if resource_hash }
    field(:state, :key               => 'zone')       { |zone_hash| @state = zone_hash['name'] if zone_hash }

    def self.client
      DonorsChooseApi::Client.new
    end

    def self.parse(link_url)
      JSON.parse(link_url)
    end

    def self.find_by_url(link_url, api_key=DEFAULT_KEY)
      response = parse(client.data_for(link_url, api_key))
      new(response['proposals'].first)
    end

    def self.find_by_id(donors_choose_id, api_key=DEFAULT_KEY)
      response = parse(client.get_id(donors_choose_id, api_key))
      new(response['proposals'].first)
    end
  end
end