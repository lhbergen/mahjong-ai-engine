Feature: Players drawing tiles
  Drawing should:
  - add tiles to the hand
  - remove tiles from the wall
  Drawing should throw an error when
  - it is not their turn to draw
  - the wall is empty
  - they have 14 tiles

  Scenario: Tiles are available from the wall and can be drawn
    Given a wall with 1 tile
    And a player named Bob
    And it is Bob's turn to draw
    When Bob draws
    Then Bob has gained 1 tile
    And the wall has lost 1 tile

  Scenario: Tiles are not available from the wall and cannot be drawn
    Given a wall with 0 tiles
    And a player named Bob
    And it is Bob's turn to draw
    When Bob draws
    Then an IllegalMove error is thrown saying "Error: Bob drew when Wall is empty"

  Scenario: Tiles are available from the wall but cannot be drawn because it is not Bob's turn
    Given a wall with 1 tile
    And a player named Bob
    And a player named Alice
    And it is Alice's turn to draw
    When Bob draws
    Then an IllegalMove error is thrown saying "Error: Bob drew during Alice's turn"

  Scenario: Tiles are available from the wall but cannot be drawn because it is not Bob's turn
    Given a wall with 1 tile
    And a player named Bob
    And it is Bob's turn to discard
    When Bob draws
    Then an IllegalMove error is thrown saying "Error: Bob drew during discard phase"

  Scenario: Tiles are available from the wall but cannot be drawn because the player has 14 tiles
    Given a wall with 1 tile
    And a player named Bob
    And Bob has 14 tiles
    And it is Bob's turn to draw
    When Bob draws
    Then an IllegalMove error is thrown saying "Error: Bob drew past 14 tiles"