class MoveCommand
  def execute(robot)
    robot.move if robot.placed?
  end
end

