module Commands
  class Place < Base
    INVALID_FACING_MESSAGE = 'INVALID FACING'

    def execute
      return unless @tabletop.valid_position?(x: x_position, y: y_position)
      return unless @robot.valid_facing?(facing)

      @robot.position.x = x_position
      @robot.position.y = y_position
      @robot.facing = facing

      nil
    end

    private

    def facing
      @facing ||= @params[2]&.to_sym
    end

    def x_position
      @x_position ||= convert_param_to_i(0)
    end

    def y_position
      @y_position ||= convert_param_to_i(1)
    end

    def is_i?(string_value)
      /\A[-+]?\d+\z/ === string_value
    end

    def convert_param_to_i(index)
      value = @params[index]
      is_i?(value) ? value&.to_i : -1
    end
  end
end
