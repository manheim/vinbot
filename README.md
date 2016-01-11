# Vinbot

Vinbot generates decodable vins for you to use in your applications.  Vinbot will also give you a vehicle object that contains the decoded information.  Vinbot is an API around the vin_bank database (https://github.com/manheim/vin_bank).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vinbot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vinbot

## Usage

There are two ways to use vinbot:

1.  Get a random, decodable vin
2. Get a vehicle object that contains the vin and all decoded information for the vehicle.

##### Get a random vin

```ruby
Vinbot::Vin.generate
=> "WBADT43443G749665"
```

##### Get a decoded vehicle object

```ruby
Vinbot::Vehicle.new
=> #<Vinbot::Vehicle:0x007fc2493717f8
 @body_type="Cargo Van",
 @drivetrain="rear wheel drive",
 @engine_type="5.6L 8 Cyl. regular unleaded",
 @exterior_color="Red Alert",
 @exterior_colors="Brilliant Silver Metallic,Glacier White,Graphite Blue Metallic,Midnight Garnet Metallic,Red Alert,Super Black",
 @interior_color="Charcoal Premium Cloth",
 @interior_colors="Charcoal Premium Cloth",
 @make="Nissan",
 @model="NV Cargo",
 @transmission="AUTOMATIC",
 @trim="3500 SV 3dr Van w/High Roof (5.6L 8cyl 5A)",
 @vehicle_type="Van",
 @vin="1N6AF0LY5EN177560",
 @year=2014>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/vinbot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
