#!/usr/bin/env ruby

require_relative '../lib/robot'
require_relative '../lib/command_processor'

robot = Robot.new
command_processor = CommandProcessor.new(robot)

ARGF.each_line { |line| 
  command_processor.process(line.strip) 
}
