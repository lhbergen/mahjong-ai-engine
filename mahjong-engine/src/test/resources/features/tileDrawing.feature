Feature: Players drawing tiles
  Drawing should:
  - add tiles to the hand
  - remove tiles from the wall
  - be invalid when it is not their turn
  - be invalid when the wall is empty

  Scenario: Tiles are available from the wall and can be drawn
    Given a wall with 1 tile
    And a player named Bob
    And it is Bob's turn
    When Bob draws
    Then Bob has gained 1 tile
    And the wall has lost 1 tile

  Scenario: Tiles are not available from the wall and cannot be drawn
    Given a wall with 0 tiles
    And a player named Bob
    And it is Bob's turn
    When Bob draws
    Then Bob has not gained tiles
    And the wall has not lost tiles

  Scenario: Tiles are available from the wall but cannot be drawn because it is not Bob's turn
    Given a wall with 1 tile
    And a player named Bob
    And a player named Alice
    And it is Alice's turn
    When Bob draws
    Then Bob has not gained tiles
    And the wall has not lost tile