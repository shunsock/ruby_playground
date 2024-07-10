# frozen_string_literal: true
# typed: strict

require 'minitest/autorun'
require 'sorbet-runtime'
require_relative '../../app/infrastructure/message_provider'

class MessageProviderTest < Minitest::Test
  extend T::Sig

  sig { void }
  def setup
    @message_provider = T.let(MessageProvider.new, T.nilable(MessageProvider))
  end

  sig { void }
  def test_show_fizz_when_counter_is_three
    test_case = 3
    assert_equal('Fizz', T.must(@message_provider).provide(test_case))
  end

  sig { void }
  def test_show_buzz_when_counter_is_five
    test_case = 5
    assert_equal('Buzz', T.must(@message_provider).provide(test_case))
  end

  sig { void }
  def test_show_fizz_buzz_when_counter_is_fifteen
    test_case = 15
    assert_equal('FizzBuzz', T.must(@message_provider).provide(test_case))
  end

  sig { void }
  def test_show_fizz_buzz_when_counter_is_multiple_of_three_and_five
    test_case = 30
    assert_equal('FizzBuzz', T.must(@message_provider).provide(test_case))
  end

  sig { void }
  def test_show_counter_when_counter_is_not_divisible_by_three_or_five
    test_case = 1
    assert_equal('1', T.must(@message_provider).provide(test_case))
  end
end
