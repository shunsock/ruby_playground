#!/bin/bash -eux

# get all files in test directory and save to array
bundle exec ruby -Itest -e 'Dir.glob("./test/**/*_test.rb") { |file| require file }'
