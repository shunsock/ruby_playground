# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'

module Printer
  extend T::Sig
  extend T::Helpers

  abstract!

  sig { abstract.returns(String) }
  def provide_message; end

  sig { returns(String) }
  def print
    self.provide_message
  end
end
