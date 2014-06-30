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

    context 'when processing a MOVE command' do
      let(:command) { 'MOVE' }

      it 'moves the robot' do
        expect(robot).to receive(:move)
        command_processor.process(command)
      end
    end

    context 'when processing a LEFT command' do
      let(:command) { 'LEFT' }

      it 'turns the robot to the left' do
        expect(robot).to receive(:left)
        command_processor.process(command)
      end
    end

    context 'when processing a RIGHT command' do
      let(:command) { 'RIGHT' }

      it 'turns the robot to the left' do
        expect(robot).to receive(:right)
        command_processor.process(command)
      end
    end

    context 'when processing a REPORT command' do
      let(:command) { 'REPORT' }

      before do
        allow(robot).to receive(:x).and_return(1)
        allow(robot).to receive(:y).and_return(2)
        allow(robot).to receive(:facing).and_return('EAST')
      end

      it 'reports the robots location via stdout' do
        expect(command_processor).to receive(:puts).with("Output: 1,2,EAST")
        command_processor.process(command)
      end
    end
  end
end
