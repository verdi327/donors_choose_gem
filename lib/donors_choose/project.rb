module DonorsChooseApi
  class Project
    DEFAULT_KEY = "DONORSCHOOSE"
    ATTRIBUTES = [:proposal_url, :fund_url, :image_url, :title, :short_description, :fulfillment_trailer,
                  :percent_funded, :cost_to_complete, :total_price, :free_shipping, :teacher_name,
                  :grade_level, :poverty_level, :school_name, :city, :zip, :state, :latitude, :state_abbr,
                  :longitude, :state, :subject, :resource_type, :expiration_date, :funding_status, :donors_choose_id
                ]
    attr_accessor :proposal_url, :fund_url, :image_url, :title, :short_description, :fulfillment_trailer,
                  :percent_funded, :cost_to_complete, :total_price, :free_shipping, :teacher_name,
                  :grade_level, :poverty_level, :school_name, :city, :zip, :state, :latitude, :state_abbr,
                  :longitude, :state, :subject, :resource_type, :expiration_date, :funding_status, :donors_choose_id

    def initialize(attributes)
      self.donors_choose_id    = attributes['id']
      self.proposal_url        = attributes['proposalURL']
      self.fund_url            = attributes['fundURL']
      self.image_url           = attributes['imageURL']
      self.title               = attributes['title']
      self.short_description   = attributes['shortDescription']
      self.fulfillment_trailer = attributes['fulfillmentTrailer']
      self.percent_funded      = attributes['percentFunded']
      self.cost_to_complete    = attributes['costToComplete']
      self.total_price         = attributes['totalPrice']
      self.free_shipping       = attributes['freeShipping']
      self.teacher_name        = attributes['teacherName']
      self.grade_level         = attributes['gradeLevel']['name']
      self.poverty_level       = attributes['povertyLevel']
      self.school_name         = attributes['schoolName']
      self.city                = attributes['city']
      self.zip                 = attributes['zip']
      self.state_abbr          = attributes['state']
      self.latitude            = attributes['latitude']
      self.longitude           = attributes['longitude']
      self.state               = attributes['zone']['state']
      self.subject             = attributes['subject']['name']
      self.resource_type       = attributes['resource']['name']
      self.expiration_date     = attributes['expirationDate']
      self.funding_status      = attributes['fundingStatus']
    end

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

    def attributes
      keys = ATTRIBUTES
      values = ATTRIBUTES.map { |attribute| self.send(attribute.to_s) }
      Hash[keys.zip(values)]
    end
  end
end