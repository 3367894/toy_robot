module Commands
  class Left < Base
    TURNS = {
      north: :west,
      west: :south,
      south: :east,
      east: :north
    }

    def execute
      return unless @robot.on_table?

      @robot.facing = TURNS[@robot.facing]
      nil
    end
  end
end
