# DonorsChoose

This is a lightweight gem for the Donors Choose Api.  It's dead simple to use.  Donors Choose requires an api key to make requests.  You can get your api key by sending an email to them at apikey[at]donorschoose[dot]org.  However, you can start using the gem right away as the Api provides a default key, which is already built into gem.  So, if no api key passed as an agrument, the default is used.

Also, to use the gem, just link to this github repo as there is another Donors Choose gem and I am too lazy to change my name at the moment.

In Rails:

    gem donors_choose, github: "verdi327/donors_choose_gem"

## Installation

Add this line to your application's Gemfile:

    gem 'donors_choose'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install donors_choose

## Usage

#### The gem has three external method to interact with.  It will return an instance of the Project class.

### Sample Call 1 (without own api key)

    DonorsChooseApi::Project.find_by_url("http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/")

### Sample Call 2

    DonorsChooseApi::Project.find_by_url("http://www.donorschoose.org/project/appletv-makes-classroom-tech-imazing/774020/", API_KEY)

### Other Methods

    DonorsChooseApi::Project.find_by_id('811882', API_KEY) #=> returns a project object

    @project.attributes #=> returns a hash of attributes

### The Project class returns these attributes
* :proposal_url
* :fund_url
* :image_url
* :title
* :short_description
* :fulfillment_trailer
* :percent_funded
* :cost_to_complete
* :total_price
* :free_shipping
* :teacher_name
* :grade_level
* :poverty_level
* :school_name
* :city
* :zip
* :state_abbr
* :latitude
* :longitude
* :state
* :subject
* :resource_type
* :expiration_date
* :funding_status

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
