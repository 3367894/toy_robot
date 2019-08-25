require 'spec_helper'

describe Commands::Report do
  let(:robot) { Robot.new }
  let(:tabletop) { Tabletop.new }

  subject { described_class.new(robot: robot, tabletop: tabletop) }

  describe '#execute' do
    let(:position) { OpenStruct.new(x: 1, y: 1) }
    let(:facing) { :north }

    before(:each) do
      robot.position.x = position.x
      robot.position.y = position.y
      robot.facing = facing
    end

    it 'returns report about robot state' do
      expect(subject.execute).to eq('1,1,NORTH')
    end

    context 'ignore command if robot not on table' do
      let(:facing) { :north }
      let(:position) { OpenStruct.new(x: -1, y: -1) }
    end
  end
end
