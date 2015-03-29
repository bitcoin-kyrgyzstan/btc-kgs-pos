# [BTC POS service for KGS](http://btc-kgs-pos.herokuapp.com/)

## Setup

Install gems:

    bundle

Create databases for development & test environments:

    rake db:create && rake db:test:prepare

Run tests:

    rspec

Run web-server:

    foreman start

Open http://localhost:3000

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
