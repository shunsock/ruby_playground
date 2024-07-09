#!/bin/bash -eux

bundle exec srb

bundle exec srb typecheck -e 'puts "Hello, world!"'

bundle exec ruby -e 'puts(require "sorbet-runtime")'
