class TurnLeftCommand
  def execute(robot)
    robot.left if robot.placed?
  end
end

