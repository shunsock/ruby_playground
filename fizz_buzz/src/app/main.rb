# typed: strict
require 'sorbet-runtime'
require_relative 'domain/loop'

class Program
  extend T::Sig

  sig { void }
  def self.main
    loop = Loop.new(1, 10)
    loop.run
  end
end

Program.main
