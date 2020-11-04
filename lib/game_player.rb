class Player
  attr_reader :name
  attr_accessor :character
  def initialize(name, character)
    @name = name
    @character = character
  end

  def switch_player
    nil
  end
end
