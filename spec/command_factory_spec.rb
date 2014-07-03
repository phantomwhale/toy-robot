require 'spec_helper'
require 'command_factory'

describe CommandFactory do
  let(:robot) { double("robot", placed?: true) }
  let(:io) { double("io") }
  let(:command_factory) { CommandFactory.new(robot, io) }
  
  describe '#create' do
    context 'when processing a PLACE instruction' do
      let(:instruction) { 'PLACE 1,2,SOUTH' }

      it 'Create a place command with the correct arguments' do
        expect(PlaceCommand).to receive(:new).with(robot, '1', '2', 'SOUTH')
        command_factory.create(instruction)
      end
    end

    context 'when processing a MOVE instruction' do
      let(:instruction) { 'MOVE' }

      it 'creates a move command' do
        expect(MoveCommand).to receive(:new).with(robot)
        command_factory.create(instruction)
      end
    end

    context 'when processing a LEFT instruction' do
      let(:instruction) { 'LEFT' }

      it 'creates a turn left command' do
        expect(TurnCommand).to receive(:new).with(robot, TurnCommand::LEFT)
        command_factory.create(instruction)
      end
    end

    context 'when processing a RIGHT instruction' do
      let(:instruction) { 'RIGHT' }

      it 'creates a turn right command' do
        expect(TurnCommand).to receive(:new).with(robot, TurnCommand::RIGHT)
        command_factory.create(instruction)
      end
    end

    context 'when processing a REPORT instruction' do
      let(:instruction) { 'REPORT' }

      it 'creates a report command' do
        expect(ReportCommand).to receive(:new).with(robot, io)
        command_factory.create(instruction)
      end
    end
  end
end
