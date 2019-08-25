module Commands
  class Base
    def self.create_command(name:, params: [], robot:, tabletop:)
      klass(name)&.new(params: params, robot: robot, tabletop: tabletop)
    end

    def initialize(params: [], robot:, tabletop:)
      @params = params
      @robot = robot
      @tabletop = tabletop
    end

    def execute
      raise NotImplementedError
    end

    private

    def self.klass_name(name)
      name.to_s.capitalize
    end

    def self.klass(name)
      prepared_name = klass_name(name)
      return nil if prepared_name == 'Base'

      Commands.const_get(prepared_name)
    rescue NameError
      nil
    end
  end
end
