require 'spec_helper'

describe Application do
  let(:robot) { Robot.new }
  let(:tabletop) { Tabletop.new }
  subject { described_class.new(robot: robot, tabletop: tabletop) }

  describe '#execute' do
    let(:options) { { robot: subject.robot, tabletop: subject.tabletop, params: %w(1 1 north) } }
    let(:command) { Commands::Place.new(options) }

    context 'with parameters' do
      it 'call command with parameters' do
        expect(Commands::Place).to receive(:new).with(options).and_return(command).once
        expect(command).to receive(:execute).once
        subject.execute('PLACE 1,1,NORTH')
      end

      it 'call command with additional spaces' do
        expect(Commands::Place).to receive(:new).with(options).and_return(command).once
        expect(command).to receive(:execute).once
        subject.execute('PLACE 1, 1, NORTH')
      end
    end

    context 'without parameters' do
      let(:options) { { robot: subject.robot, tabletop: subject.tabletop, params: [] } }
      let(:command) { Commands::Move.new(options) }

      it 'call command with parameters' do
        expect(Commands::Move).to receive(:new).with(options).and_return(command).once
        expect(command).to receive(:execute).once
        subject.execute('MOVE')
      end
    end

    it 'call command with downcase' do
      expect(Commands::Place).to receive(:new).with(options).and_return(command).once
      expect(command).to receive(:execute).once
      subject.execute('place 1, 1, north')
    end

    it 'does nothing when command name is wrong' do
      expect{ subject.execute('wrong_command') }.not_to raise_error
    end
  end
end
