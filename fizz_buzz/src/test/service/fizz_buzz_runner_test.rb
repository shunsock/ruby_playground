# frozen_string_literal: true
# typed: strict

require 'minitest/autorun'
require 'sorbet-runtime'
require_relative '../../app/service/fizz_buzz_runner'

class FizzBuzzRunnerTest < Minitest::Test
  extend T::Sig

  sig { void }
  def setup
    @fizz_buzz_runner = T.let(FizzBuzzRunner.new, T.nilable(FizzBuzzRunner))
  end

  sig { void }
  def test_run_successfully
    T.must(@fizz_buzz_runner).run
  end
end
