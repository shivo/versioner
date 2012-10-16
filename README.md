# versioner-rails

This gem allows you to easily add, update, and retrieve a version number for your Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'versioner-rails', :require => 'versioner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install versioner-rails

Then run the installer:

    $ rails generate versioner:install

This adds these files:

* **[RAILS_ROOT]/config/versioner.yml** - This is where the version number is stored.
* **[RAILS_ROOT]/config/initializers/versioner.rb** - This is where you can configure options. The only option available right now is **storage_path**, which allows you to change the location of versioner.yml.

## Usage

Version numbers follow the format *Major.Minor.Patch*.

Force a new version number like this:

    $ rake versioner:force[1,0,3]

Then you can update it:

    $ rake versioner:increment_major
    $ rake versioner:increment_minor
    $ rake versioner:increment_patch

And get it:

    $ rake versioner:version

Within your Rails app, you can use the following to get your app's version as a string:

    Versioner.version

## Details

Right now, the version is stored in YAML format, by default under config/versioner.yml. This location can be changed in config/initializers/versioner.rb.

More storage back-end options are coming.

## Roadmap

* Fully support [Semantic Versioning](http://semver.org)
* More storage back-ends
* Extract the core into a new gem, versioner
* More gems for other frameworks (e.g., Sinatra)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT
