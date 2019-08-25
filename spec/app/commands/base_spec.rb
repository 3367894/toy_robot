require 'spec_helper'

describe Commands::Base do
  describe '#execute' do
    subject { Commands::Base.new(robot: nil, tabletop: nil)}

    it 'raise error' do
      expect { subject.execute }.to raise_error(NotImplementedError)
    end
  end

  describe '.create_command' do
    class Commands::Test < Commands::Base
    end

    it 'returns created command' do
      created_class = described_class.create_command(name: :test, robot: nil, tabletop: nil)
      expect(created_class).to be_a(Commands::Test)
    end

    it 'returns nil if cannot create command' do
      created_class = described_class.create_command(name: :wrong_command, robot: nil, tabletop: nil)
      expect(created_class).to be_nil
    end

    it 'returns nil if command name is base' do
      created_class = described_class.create_command(name: :base, robot: nil, tabletop: nil)
      expect(created_class).to be_nil
    end
  end
end
