Feature: Mahjong can only be declared when it matches a winning hand
  Declaring Mahjong should result in an error when:
  - A hand does not match a winning Mahjong hand
  - The player does not have 14 tiles
  - It is not the player's turn to discard/declare Mahjong

  Scenario: A player has a winning hand
    Given a player named Bob
    And Bob has Mahjong
    And it is Bob's turn to discard
    When Bob declares Mahjong
    Then the game is over
    And Bob has won

  Scenario: A player does not have a winning hand
    Given a player named Bob
    And Bob has 14 tiles that aren't Mahjong
    And it is Bob's turn to discard
    When Bob declares Mahjong
    Then the action is rejected because Bob does not have Mahjong

  Scenario: A player cannot declare Mahjong because they have 13 tiles
    Given a player named Bob
    And Bob has 13 tiles
    And it is Bob's turn to discard
    When Bob declares Mahjong
    Then the action is rejected because Bob declared Mahjong at 13 tiles

  Scenario: A player cannot declare Mahjong because it is not their turn
    Given a player named Bob
    And a player named Alice
    And it is Alice's turn to discard
    When Bob declares Mahjong
    Then the action is rejected because Bob declared Mahjong during Alice's turn

  Scenario: A player cannot declare Mahjong because it is not the discard phase
    Given a player named Bob
    And it is Bob's turn to draw
    When Bob declares Mahjong
    Then the action is rejected because Bob declared Mahjong during the draw phase