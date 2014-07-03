require 'instruction_processor'

describe InstructionProcessor do
  let(:command) { double("command", execute: nil) }
  let(:command_factory) { double("command_factory", create: command) }

  subject(:instruction_processor) { InstructionProcessor.new(command_factory) }
  
  describe '#process' do
    let(:instruction) { "DO SOMETHING" }

    it 'creates a command from the instruction using the command factory' do
      expect(command_factory).to receive(:create).with(instruction)
      instruction_processor.process(instruction)
    end

    it 'executes the created command' do
      expect(command).to receive(:execute)
      instruction_processor.process(instruction)
    end
  end
end
