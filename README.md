# SpecDurr

The dumbest-thing-that-could-work for pretty-printing a directory of
specs that can't print themselves (currently, in languages that use
brackets for scoping).

---

One of the best things about describing your tests as specs is reading
through them to make sure you're covering all the positive, negative,
and edge cases, and generally capturing the business needs.

However, some test frameworks, especially those in Objective-C (and some
in JavaScript) don't provide a simple & pretty green-and-yellow nested
spec output for finished and pending specs (respectively).

So, this just reads through spec files, pulls out the spec descriptions
with a regex, and prints a nested green-and-yellow output of done &
pending.

Assuming all your specs are passing, it gets the job done.

## Installation

Add this line to your application's Gemfile:

    gem 'spec_durr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spec_durr

## Usage

    spec_durr Tests/Specs/**/*.m

## Contributing

1. Fork it ( http://github.com/<my-github-username>/spec_durr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
