# CONTENTdm API for Ruby

Ruby bindings for the CONTENTdm API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contentdm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contentdm

Include the library in your code:

`require 'contentdm'`


## Quick Start - Fetch Item Metadata


**Retrieve Item Metadata Along With Its Compound Object Info (If it Exists)**

```
Contentdm::CompoundItem.new(base_url: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php', 
                            collection: 'p16022coll39', id: 446).metadata
```

CompoundItem has been added as a convenience. It is a wrapper around the `Contentdm::RequestBatch` feature (see below).

**Call a CONTENTdm API function directoy**

The following shows the default keyword arguments for the Service class. Please refer to the [CONTENTdm API](https://www.oclc.org/support/services/contentdm/help/customizing-website-help/other-customizations/contentdm-api-reference.en.html) for details on each API function and corresponding parameters. Parameters must be passed as an array in the order specified in the CONTENTdm API instructions.

```
service = Contentdm::Service.new(function: 'wsAPIDescribe', params: [], format: 'json')

response = Contentdm::Request.new(base_url: 'http://www.example.com', service: service)
```

**Request multiple CONTENTdm functions/endpoints at once**

```
service_configs = [{function: 'dmGetItemInfo', params: [collection, id]},
                   {function: 'dmGetCompoundObjectInfo', params: [collection, id]}]

responses = Contentdm::RequestBatch.new(base_url: base_url, service_configs: service_configs).fetch
```

You may also use the Response class to parse and handle API inconsistencies (e.g. calls for non-existent collections result in non-JSON HTML responses):

```
responses.map { |resp| Contentdm::Response.new(raw_data: resp[:value]).parsed }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/UMNLibraries/contentdm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

MIT
