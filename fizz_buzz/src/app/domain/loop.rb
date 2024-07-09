# typed: strict

require 'sorbet-runtime'

class Loop
  extend T::Sig

  sig { returns(Integer) }
  attr_reader :start_with

  sig { returns(Integer) }
  attr_reader :end_with

  sig {params(start_with: Integer, end_with: Integer).void}
  def initialize(
    start_with,
    end_with
  )
    @start_with = start_with
    @end_with = end_with
  end

  sig { void }
  def run
    puts 'run!'
  end
end
