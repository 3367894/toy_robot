module Commands
  class Report < Base
    def execute
      return unless @robot.on_table?

      "#{@robot.position.x},#{@robot.position.y},#{@robot.facing.upcase}"
    end
  end
end
