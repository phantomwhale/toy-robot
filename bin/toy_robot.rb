#!/usr/bin/env ruby

require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/instruction_processor'

robot = Robot.new(Table.new)
command_factory = CommandFactory.new(robot)
instruction_processor = InstructionProcessor.new(command_factory)

ARGF.each_line { |line| 
  instruction_processor.process(line.strip) 
}
