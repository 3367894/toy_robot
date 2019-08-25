require 'readline'
require_relative 'app/robot'
require_relative 'app/tabletop'
require_relative 'app/commands'
require_relative 'app/application'

robot = Robot.new
tabletop = Tabletop.new
application = Application.new(robot: robot, tabletop: tabletop)

while (input = Readline.readline("> ", true))
  break if input.strip == 'exit'

  application.execute(input)
end
