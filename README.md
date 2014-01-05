# Junkie

Junkie is a simple ruby CLI for cloning git repos from jenkins views

## Installation

    $ gem install junkie

## Usage

    $ junkie list view_name
    $ junkie clone view_name
    $ junkie --help

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Building the source

To build and run all tests just run rake:

    $ rake

This will start a jenkins server, and run the specs, and finally stop jenkins.

Starting jenkins does take some time, so to get a more rapid workflow you can start jenkins in another terminal.

    $ rake start_jenkins

then just run the specs each time you change something:

    $ rake spec