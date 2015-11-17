# Civu

Civu is a simple ruby CLI for cloning git repos from jenkins views

## Installation

    $ gem install civu

## Usage

List:

    $ civu list view_name
    $ civu list view_name --url https://myjenkins.org
    $ civu list view_name --url https://myjenkins.org --username kenglxn
    $ civu list view_name --url https://myjenkins.org --username kenglxn --password secret

Clone:

    $ civu clone view_name
    $ civu clone view_name --url https://myjenkins.org
    $ civu clone view_name --url https://myjenkins.org --username kenglxn
    $ civu clone view_name --url https://myjenkins.org --username kenglxn --password secret

Help:

    $ civu --help

Note:
the view_name argument and the url, username and password options are required.
If you do not supply them, you will be asked for them interactively.
The interactive mode is recommended for password, since you dont want it laying around in your shells history.

## Ruby Version

Verified to work with the following ruby versions:
* 1.9.3-p392
* 2.0.0-p0

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

Then just run the specs each time you change something:

    $ rake spec

