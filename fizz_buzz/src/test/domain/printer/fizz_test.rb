# frozen_string_literal: true
# type: strict

require 'minitest/autorun'
require 'sorbet-runtime'
require_relative '../../../app/domain/printer/fizz'

class FizzTest < Minitest::Test
  extend T::Sig

  sig { void }
  def setup
    @fizz = Fizz.new
  end

  sig { void }
  def test_provide_message
    assert_equal("Fizz", @fizz.provide_message)
  end

  sig { void }
  def test_print
    assert_equal("Fizz", @fizz.print)
  end

end
