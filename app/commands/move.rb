module Commands
  class Move < Base
    def execute
      new_position = case @robot.facing
                     when :north
                       [@robot.position.x, @robot.position.y + 1]
                     when :south
                       [@robot.position.x, @robot.position.y - 1]
                     when :east
                       [@robot.position.x + 1, @robot.position.y]
                     when :west
                       [@robot.position.x - 1, @robot.position.y]
                     end

      return unless @tabletop.valid_position?(x: new_position[0], y: new_position[1])

      @robot.position.x = new_position[0]
      @robot.position.y = new_position[1]

      nil
    end
  end
end
