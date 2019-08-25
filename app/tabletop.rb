require 'pry-byebug'

class Tabletop
  attr_reader :dimensions

  def initialize
    config = YAML.load(File.read(config_path))
    @dimensions = OpenStruct.new(config['dimensions'])
  end

  def valid_position?(x:, y:)
    return false if x < 0 || y < 0
    return false if x > @dimensions.x - 1
    return false if y > @dimensions.y - 1

    true
  end

  private

  def config_path
    @config_path ||= if ENV['APP_ENV'] == 'test'
                       File.join(File.dirname(__FILE__), '../spec/fixtures/tabletop.yml')
                     else
                       File.join(File.dirname(__FILE__), '../config/tabletop.yml')
                     end
  end
end
