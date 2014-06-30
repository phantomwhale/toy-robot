class TurnRightCommand
  def execute(robot)
    robot.right if robot.placed?
  end
end

