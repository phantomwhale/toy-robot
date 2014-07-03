require 'report_command'

describe ReportCommand do
  let(:robot) { double("robot", location: '1,2,SOUTH') }
  let(:io) { double("io") }

  subject(:command) { ReportCommand.new(robot, io) }

  describe '#execute' do
    it 'outputs the robots current status' do
      expect(io).to receive(:puts).with("1,2,SOUTH")
      command.execute
    end

    context 'when the robot reports an empty location' do
      before do
        allow(robot).to receive(:location).and_return(nil)
      end

      it 'outputs nothing' do
        expect(io).to_not receive(:puts)
        command.execute
      end
    end
  end
end
