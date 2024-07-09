# frozen_string_literal: true
# typed: strict

require 'sorbet-runtime'
require_relative '../../app/domain/loop'
require_relative '../../app/domain/printer/fizz'
require_relative '../../app/domain/printer/buzz'
require_relative '../../app/domain/printer/fizz_buzz'
require_relative '../../app/infrastructure/message_provider'


class FizzBuzzRunner
  extend T::Sig

  sig { returns(Loop) }
  attr_reader :loop

  sig { returns(MessageProvider) }
  attr_reader :message_provider

  sig { params(loop: Loop, message_provider: MessageProvider).void }
  def initialize(
    loop: Loop.new(1, 100),
    message_provider: MessageProvider.new
  )
    @loop = T.let(loop, Loop)
    @message_provider = T.let(message_provider, MessageProvider)
  end

  sig { void }
  def run
    (@loop.start_with..@loop.end_with).each do |i|
      puts @message_provider.provide(i)
    end
  end
end
