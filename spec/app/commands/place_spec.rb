require 'spec_helper'

describe Commands::Place do
  let(:robot) { Robot.new }
  let(:tabletop) { Tabletop.new }
  let(:params) { %w(1 2 north) }

  subject { described_class.new(robot: robot, tabletop: tabletop, params: params) }

  describe '#execute' do
    it 'sets robot position' do
      subject.execute
      expect(robot.position.x).to eq(1)
      expect(robot.position.y).to eq(2)
      expect(robot.facing).to eq(:north)
    end

    context 'invalid x position' do
      context 'not on table' do
        let(:params) { %w(-1 2 north) }

        it 'not sets nothing' do
          subject.execute
          expect(robot.position.x).to eq(-1)
          expect(robot.position.y).to eq(-1)
          expect(robot.facing).to be_nil
        end
      end

      context 'not number' do
        let(:params) { %w(a 2 north) }

        it 'not sets nothing' do
          subject.execute
          expect(robot.position.x).to eq(-1)
          expect(robot.position.y).to eq(-1)
          expect(robot.facing).to be_nil
        end
      end
    end

    context 'invalid y position' do
      context 'not on table' do
        let(:params) { %w(1 -2 north) }

        it 'not sets nothing' do
          subject.execute
          expect(robot.position.x).to eq(-1)
          expect(robot.position.y).to eq(-1)
          expect(robot.facing).to be_nil
        end
      end

      context 'not number' do
        let(:params) { %w(1 a north) }

        it 'not sets nothing' do
          subject.execute
          expect(robot.position.x).to eq(-1)
          expect(robot.position.y).to eq(-1)
          expect(robot.facing).to be_nil
        end
      end
    end

    context 'invalid facing' do
      let(:params) { %w(1 2 wrong_facing) }

      it 'not sets nothing' do
        subject.execute
        expect(robot.position.x).to eq(-1)
        expect(robot.position.y).to eq(-1)
        expect(robot.facing).to be_nil
      end
    end
  end
end
