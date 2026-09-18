Feature: Jokers can act as any tile in a:
  - Pung (3)
  - Kong (4)
  - Quint (5)
  - Sextet (6)

  Jokers cannot act as a single or a pair
  Jokers cannot be claimed after discard
  Jokers in an exposure can be exchanged for the tile they represent

  Scenario: A player can use jokers to form a meld
    Given a player named Bob
    And a player named Alice
    And Bob has 4 Jokers
    And Bob does not have a One Bam
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a kong
    Then Bob has an exposure of a kong of One Bams

  Scenario: Claiming is skipped when a Joker is discarded
    Given a player named Bob
    And a player named Alice
    And Bob has a Joker
    And it is Bob's turn to discard
    When Bob discards Joker
    Then it is Alice's turn to draw

  Scenario: Jokers can be exchanged without skipping a discard
    Given a player named Bob
    And a player named Alice
    And Alice has a One Bam
    And Alice does not have a Joker
    And Bob has an exposure of a kong of One Bams with 1 Joker
    And it is Alice's turn to discard
    When Alice swaps for Bob's One Bam
    Then Alice has a Joker
    And Bob has an exposure of a kong of One Bams with no Jokers
    And it is Alice's turn to discard

  Scenario: Jokers cannot be exchanged if the player does not have the tile
    Given a player named Bob
    And a player named Alice
    And Alice does not have a One Bam
    And Alice does not have a Joker
    And Bob has an exposure of a kong of One Bams with 1 Joker
    And it is Alice's turn to discard
    When Alice swaps for Bob's One Bam
    Then the action is rejected because Alice swapped without the tile

  Scenario: Jokers cannot be exchanged if the meld does not have jokers
    Given a player named Bob
    And a player named Alice
    And Alice has a One Bam
    And Bob has an exposure of a kong of One Bams with no Jokers
    And it is Alice's turn to discard
    When Alice swaps for Bob's One Bam
    Then the action is rejected because Alice swapped for an exposure without Jokers

  Scenario: Jokers cannot be exchanged out of turn
    Given a player named Bob
    And a player named Alice
    And Alice has a One Bam
    And Bob has an exposure of a kong of One Bams with 1 Joker
    And it is Bob's turn to discard
    When Alice swaps for Bob's One Bam
    Then the action is rejected because Alice swapped during Bob's turn

  Scenario: Jokers cannot be exchanged out of phase
    Given a player named Bob
    And a player named Alice
    And Alice has a One Bam
    And Bob has an exposure of a kong of One Bams with 1 Joker
    And it is Alices's turn to draw
    When Alice swaps for Bob's One Bam
    Then the action is rejected because Alice swapped during draw phase

  Scenario: Jokers cannot be used as a single
    Given a player named Bob
    And Bob is a single short of Mahjong
    And the next tile is a Joker
    And it is Bob's turn to draw
    When Bob draws
    And Bob declares Mahjong
    Then the action is rejected because Bob declared Mahjong without a winning hand

