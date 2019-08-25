class Application
  attr_reader :robot, :tabletop

  def initialize(robot:, tabletop:)
    @robot = robot
    @tabletop = tabletop
  end

  def execute(input)
    command_name, params = command_data(input)

    command = Commands::Base.create_command(
      name: command_name,
      params: params,
      robot: robot,
      tabletop: tabletop
    )
    return if command.nil?

    res = command.execute
    puts res if res
  end

  private
  def split_input(input)
    input.split(/[, ]/).select { |word| word.!= '' }.map(&:downcase)
  end

  def command_data(input)
    splitted_input = split_input(input)
    command_name = splitted_input[0]
    params = splitted_input[1..-1]

    [command_name, params]
  end
end
