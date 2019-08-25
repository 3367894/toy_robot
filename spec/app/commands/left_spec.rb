require 'spec_helper'

describe Commands::Left do
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

    context 'from north' do
      it 'turn west' do
        subject.execute
        expect(robot.facing).to eq(:west)
      end
    end

    context 'from west' do
      let(:facing) { :west }

      it 'turn south' do
        subject.execute
        expect(robot.facing).to eq(:south)
      end
    end

    context 'from south' do
      let(:facing) { :south }

      it 'turn east' do
        subject.execute
        expect(robot.facing).to eq(:east)
      end
    end

    context 'from east' do
      let(:facing) { :east }

      it 'turn north' do
        subject.execute
        expect(robot.facing).to eq(:north)
      end
    end

    context 'ignore command if robot not on table' do
      let(:facing) { :north }
      let(:position) { OpenStruct.new(x: -1, y: -1) }

      it 'does nothing' do
        subject.execute
        expect(robot.position.x).to eq(-1)
        expect(robot.position.y).to eq(-1)
        expect(robot.facing).to eq(:north)
      end
    end
  end
end
