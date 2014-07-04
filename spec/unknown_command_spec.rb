require 'unknown_command'

describe UnknownCommand do
  let(:io) { double("io") }

  subject(:command) { UnknownCommand.new("gibberish", io) }

  describe '#execute' do
    it 'outputs the unknown instruction' do
      expect(io).to receive(:puts).with("Unknown instruction: gibberish")
      command.execute
    end
  end
end
