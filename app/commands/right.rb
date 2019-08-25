module Commands
  class Right < Base
    TURNS = {
      north: :east,
      east: :south,
      south: :west,
      west: :north
    }

    def execute
      return unless @robot.on_table?

      @robot.facing = TURNS[@robot.facing]

      nil
    end
  end
end
