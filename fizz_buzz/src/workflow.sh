#!/bin/bash -eux

# Install dependencies
bundle install

# Run static analysis
bundle exec srb tc

# Run all tests
bundle exec ruby -Itest -e 'Dir.glob("./test/**/*_test.rb") { |file| require file }'
