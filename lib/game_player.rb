# frozen_string_literal: true

require_relative './colorize-0.8.1/lib/colorize'
class Player
  attr_reader :name, :character

  def initialize(name, character, color)
    @name = name.colorize(color)
    @character = character.colorize(color)
  end
end
