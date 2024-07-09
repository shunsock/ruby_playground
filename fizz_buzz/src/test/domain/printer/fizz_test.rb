# frozen_string_literal: true
# typed: strict

require 'minitest/autorun'
require 'sorbet-runtime'
require_relative '../../../app/domain/printer/fizz'

class FizzTest < Minitest::Test
  extend T::Sig

  sig { void }
  def setup
    @fizz_buzz = T.let(Fizz.new, T.nilable(Fizz))
  end

  sig { void }
  def test_provide_message
    assert_equal("Fizz", T.must(@fizz_buzz).provide_message)
  end

  sig { void }
  def test_print
    assert_equal("Fizz", T.must(@fizz_buzz).print)
  end
end