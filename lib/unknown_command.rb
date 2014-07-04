class UnknownCommand
  def initialize(instruction, io)
    @instruction = instruction
    @io = io
  end

  def execute
    @io.puts "Unknown instruction: #{@instruction}"
  end
end
