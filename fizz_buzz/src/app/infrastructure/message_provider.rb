# frozen_string_literal: true
# typed: strict

require 'sorbet-runtime'
require_relative '../domain/printer/fizz'
require_relative '../domain/printer/buzz'
require_relative '../domain/printer/fizz_buzz'


class MessageProvider
  extend T::Sig

  sig { void }
  def initialize
    @fizz = T.let(Fizz.new, Fizz)
    @buzz = T.let(Buzz.new, Buzz)
    @fizz_buzz = T.let(FizzBuzz.new, FizzBuzz)
  end

  sig { params(counter: Integer).returns(String) }
  def provide(counter)
    if (counter % 3).zero? && (counter % 5).zero?
      @fizz_buzz.provide_message
    elsif (counter % 3).zero?
      @fizz.provide_message
    elsif (counter % 5).zero?
      @buzz.provide_message
    else
      counter.to_s
    end
  end
end
