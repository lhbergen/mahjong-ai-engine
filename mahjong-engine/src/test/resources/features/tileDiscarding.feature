Feature: Players discarding tiles
  Discarding should:
    - Remove a tile from the player hand
    - Add a tile to the discard pile
  Discarding should throw an error if
    - It is not the player's turn to discard
    - The player has 13 tiles

  Scenario: Tiles are available in the player's hand and can be discarded
    Given a player named Bob
    And Bob's hand has 14 tiles
    And it is Bob's turn to discard
    When Bob discards
    Then Bob's hand has lost 1 tile
    And the discard has gained 1 tile

  Scenario: Tiles are available in the player's hand and cannot be discarded out of turn
    Given a player named Bob
    And a player named Alice
    And Bob's hand has 14 tiles
    And it is Alice's turn to discard
    When Bob discards
    Then the action is rejected because Bob discarded during Alice's turn

  Scenario: Tiles are available in the player's hand and cannot be discarded during draw
    Given a discard with 0 tiles
    And a player named Bob
    And Bob's hand has 14 tiles
    And it is Bob's turn to draw
    When Bob discards
    Then the action is rejected because Bob discarded during the draw phase

  Scenario: Tiles are not available in the player's hand to discard
    Given a discard with 0 tiles
    And a player named Bob
    And Bob's hand has 13 tiles
    And it is Bob's turn to discard
    When Bob discards
    Then the action is rejected because Bob discarded at 13 tiles
