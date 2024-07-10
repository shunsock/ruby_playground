# frozen_string_literal: true
# typed: strict

require 'minitest/autorun'
require 'sorbet-runtime'
require_relative '../../app/infrastructure/message_provider'

class MessageProviderTest < Minitest::Test
  extend T::Sig

  sig { returns(MessageProvider) }
  attr_reader :message_provider

  sig { params(name: T.nilable(String)).void }
  def initialize(name = nil)
    super
    @message_provider = T.let(MessageProvider.new, MessageProvider)
  end

  sig { void }
  def setup; end

  sig { void }
  def test_show_fizz_when_counter_is_three
    test_case = 3
    assert_equal('Fizz', @message_provider.provide(test_case))
  end

  sig { void }
  def test_show_buzz_when_counter_is_five
    test_case = 5
    assert_equal('Buzz', @message_provider.provide(test_case))
  end

  sig { void }
  def test_show_fizz_buzz_when_counter_is_fifteen
    test_case = 15
    assert_equal('FizzBuzz', @message_provider.provide(test_case))
  end

  sig { void }
  def test_show_fizz_buzz_when_counter_is_multiple_of_three_and_five
    test_case = 30
    assert_equal('FizzBuzz', @message_provider.provide(test_case))
  end

  sig { void }
  def test_show_counter_when_counter_is_not_divisible_by_three_or_five
    test_case = 1
    assert_equal('1', @message_provider.provide(test_case))
  end
end
