# frozen_string_literal: true
# typed: strict

require 'sorbet-runtime'
require_relative 'printer'

class FizzBuzz
  extend T::Sig

  include Printer

  sig { override.returns(String) }
  def provide_message
    'FizzBuzz'
  end
end
