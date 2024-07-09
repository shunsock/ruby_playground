# type: strict

require 'sorbet-runtime'

class Loop
  extend T::Sig

  attr_reader :start_with
  attr_reader :end_with

  sig {params(start_with: Integer, end_with: Integer).void}
  def initialize(
    start_with,
    end_with
  )
    @start_with=start_with
    @end_with=end_with
  end
end
