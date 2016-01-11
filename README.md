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
=> #<Vinbot::Vehicle:0x007fd05141e708
 @body_type="Passenger Minivan",
 @drivetrain="front wheel drive",
 @engine_type="3.3L 6 Cyl. flex-fuel (unleaded/E85)",
 @exterior_colors=
  ["Blackberry Pearlcoat",
   "Bright Silver Metallic Clearcoat",
   "Brilliant Black Crystal Pearlcoat",
   "Dark Cordovan Pearlcoat",
   "Dark Titanium Metallic Clearcoat",
   "Deep Cherry Red Crystal Pearlcoat",
   "Deep Water Blue Pearlcoat",
   "Inferno Red Crystal Pearlcoat",
   "Stone White Clearcoat",
   "White Gold Clearcoat"],
 @interior_colors=["Dark Slate Gray/Light Shale (Cloth)", "Medium Slate Gray/Light Shale (Cloth)"],
 @make="Dodge",
 @model="Grand Caravan",
 @transmission="AUTOMATIC",
 @trim="SE 4dr Minivan (3.3L 6cyl 4A)",
 @vehicle_type="Minivan",
 @vin="2D4RN4DE1AR507053",
 @year=2010>
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
