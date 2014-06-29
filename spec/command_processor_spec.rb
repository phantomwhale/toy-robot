require 'spec_helper'
require 'command_processor'

describe CommandProcessor do
  let(:robot) { double("robot") }
  subject(:command_processor) { CommandProcessor.new(robot) }
  
  describe '#process' do
    context 'when processing a PLACE command' do
      let(:command) { 'PLACE 1,2,SOUTH' }

      it 'places the robot in the position and facing indicated' do
        expect(robot).to receive(:place).with('1', '2', 'SOUTH')
        command_processor.process(command)
      end
    end
  end
end
