Feature: We can place and move the robot around

  Scenario: Simple place, move and report
    Given a file named "instructions.txt" with:
      """
        PLACE 0,0,NORTH 
        MOVE 
        REPORT 
      """
    When I successfully run `toy_robot.sh -f /tmp/instructions.txt`
    And the stdout should contain "Output: 0,1,NORTH"
