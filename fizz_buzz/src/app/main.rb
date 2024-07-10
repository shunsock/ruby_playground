# typed: strict
require 'sorbet-runtime'
require_relative 'service/fizz_buzz_runner'

class Program
  extend T::Sig

  sig { void }
  def self.main
    loop = Loop.new(1, 30)
    fizz_buzz_runner = FizzBuzzRunner.new(loop: loop)
    fizz_buzz_runner.run
  end
end

Program.main
