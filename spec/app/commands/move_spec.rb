require 'spec_helper'

describe Commands::Move do
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

    context 'move to north' do
      it 'sets new position for robot' do
        subject.execute
        expect(robot.position.x).to eq(1)
        expect(robot.position.y).to eq(2)
        expect(robot.facing).to eq(:north)
      end
    end

    context 'move to south' do
      let(:facing) { :south }

      it 'sets new position for robot' do
        subject.execute
        expect(robot.position.x).to eq(1)
        expect(robot.position.y).to eq(0)
        expect(robot.facing).to eq(:south)
      end
    end

    context 'move to east' do
      let(:facing) { :east }

      it 'sets new position for robot' do
        subject.execute
        expect(robot.position.x).to eq(2)
        expect(robot.position.y).to eq(1)
        expect(robot.facing).to eq(:east)
      end
    end

    context 'move to west' do
      let(:facing) { :west }

      it 'sets new position for robot' do
        subject.execute
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(1)
        expect(robot.facing).to eq(:west)
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

    context 'move to fall' do
      let(:facing) { :north }
      let(:position) { OpenStruct.new(x: 2, y: 2) }

      it 'does nothing' do
        subject.execute
        expect(robot.position.x).to eq(2)
        expect(robot.position.y).to eq(2)
        expect(robot.facing).to eq(:north)
      end
    end
  end
end
