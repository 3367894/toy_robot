class Robot
  FACINGS = Set.new([:north, :south, :west, :east])

  attr_accessor :facing
  attr_reader :position

  def initialize
    @position = OpenStruct.new(x: -1, y: -1)
    @facing = nil
  end

  def on_table?
    return false if facing.nil? || !valid_facing?(facing)
    return false if position.x < 0 || position.y < 0

    true
  end

  def valid_facing?(facing)
    FACINGS.include?(facing)
  end
end
