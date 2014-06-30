Feature: We can place and move the robot around

  Scenario: Simple place, move and report
    Given a file named "instructions.txt" with:
      """
        PLACE 0,0,NORTH 
        MOVE 
        REPORT 
      """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should contain "Output: 0,1,NORTH"

  Scenario: Simple place, turn and report
    Given a file named "instructions.txt" with:
      """
        PLACE 0,0,NORTH 
        LEFT 
        REPORT 
      """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should contain "Output: 0,0,WEST"

  Scenario: Longer turn and move, then report
    Given a file named "instructions.txt" with:
      """
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
      """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should contain "Output: 3,3,NORTH"

  Scenario: Unplaced robots do nothing
    Given a file named "instructions.txt" with:
      """
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
      """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should not contain "Output:"

  Scenario: Robots do not walk off the table (5x5)
    Given a file named "instructions.txt" with:
    """
      PLACE 2,4,NORTH
      MOVE
      REPORT
    """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should contain "Output: 2,4,NORTH"

  Scenario: Robots can be placed multiple times
    Given a file named "instructions.txt" with:
    """
      PLACE 2,2,NORTH
      MOVE
      PLACE 1,1,EAST
      REPORT
    """
    When I successfully run `toy_robot.rb instructions.txt`
    And the stdout should contain "Output: 1,1,EAST"
