# GetSeo

Welcome to [GetSeo](https://rubygems.org/gems/get_seo)! This is a CLI based gem that allows you to quickly and easily inspect various SEO metrics from websites of your choice. Simply enter the url of a website you’d like to inspect, select the SEO metric you would like to retrieve, and [GetSeo](https://rubygems.org/gems/get_seo) will display your results via the terminal.

---

## Installation

### Option (1)

* Add this line to your application's Gemfile:

`gem 'get_seo'`

* Run bundle from your terminal

`$ bundle`

### Option (2)

Install the gem on your local system:

`$ gem install get_seo`

---

## CLI Usage

###  Go to the project directory:

`$ cd get_seo/`

### Begin a GetSeo session:

`$ ruby bin/get-seo`

or alternatively

`$ ./bin/get-seo`

###### Note: You may receive a `Permission Denied` error. Fix it by doing the following:

##### (step 1)
`$ cd bin/`

##### (step 2)
`$ ls -lah`

* Assuming your `get-seo` file doesn't have the following permission(s): `-rwxr-xr-x`

##### (step 3)
`$ chmod +x get-seo`

##### (step 4)
`$ ls -lah` will verify your changes took effect

---

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

---

## Creator

### Dominic McKellar

* Website: [domckellar.com](http://domckellar.com/)

* Blog: [newme.io](http://newme.io/)

* Github: [@Dom-Mc](https://github.com/Dom-Mc)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/get_seo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
