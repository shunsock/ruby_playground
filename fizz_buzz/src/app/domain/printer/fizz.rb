# frozen_string_literal: true
# typed: strict

require 'sorbet-runtime'
require_relative 'printer'

class Fizz
  extend T::Sig

  include Printer

  sig { override.returns(String) }
  def provide_message
    'Fizz'
  end
end
