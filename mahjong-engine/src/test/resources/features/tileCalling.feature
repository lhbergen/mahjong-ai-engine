Feature: Players can call tiles for an exposure
  Exposure can only be called when it completes a:
  - Pung (3)
  - Kong (4)
  - Quint (5)
  - Sextet (6)
  Unless the tile is called to declare Mahjong, in which case it can be called for a Pair (2) or Single (1)

  Calling exposure should result in an error when:
  - it is not their turn to call
  - The player cannot complete a set of 3 or more OR cannot declare Mahjong

  Scenario: Tiles are available and can be called for a pung
    Given a player named Bob
    And a player named Alice
    And Bob has 2 One Bams
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a pung
    Then the discard has not gained a tile
    And Bob has an exposue of a pung of One Bams

  Scenario: Tiles are available and can be called for a kong
    Given a player named Bob
    And a player named Alice
    And Bob has 3 One Bams
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a kong
    Then the discard has not gained a tile
    And Bob has an exposue of a kong of One Bams

  Scenario: Tiles are available and can be called for a quint
    Given a player named Bob
    And a player named Alice
    And Bob has 3 One Bams
    And Bob has a Joker
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a quint
    Then the discard has not gained a tile
    And Bob has an exposue of a quint of One Bams

  Scenario: Tiles are available and can be called for a sextet
    Given a player named Bob
    And a player named Alice
    And Bob has 3 One Bams
    And Bob has 2 Jokers
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a sextet
    Then the discard has not gained a tile
    And Bob has an exposue of a sextet of One Bams

  Scenario: Tiles are available and can be called for a single to make mahjong
    Given a player named Bob
    And a player named Alice
    And Bob needs a single One Bam for Mahjong
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a single
    And Bob declares Mahjong
    Then the discard has not gained a tile
    And Bob has won

  Scenario: Tiles are available and can be called for a pair to make mahjong
    Given a player named Bob
    And a player named Alice
    And Bob needs a pair of One Bams for Mahjong
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a single
    And Bob declares Mahjong
    Then the discard has not gained a tile
    And Bob has won

  Scenario: Tiles cannot be called out of turn
    Given a player named Bob
    And it is Bob's turn to discard
    When Bob discards
    And Bob calls the discard for a pung
    Then the action is rejcted because Bob called out of turn

  Scenario: Tiles cannot be called out of phase
    Given a player named Bob
    And it is Bob's turn to draw
    When Bob calls the discard for a pung
    Then the action is rejected because Bob called during the draw phase

  Scenario: Tiles cannot be called for a single otherwise
    Given a player named Bob
    And a player named Alice
    And Bob does not have a One Bam
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a single
    Then the action is rejected because Bob called for a single

  Scenario: Tiles cannot be called for a double otherwise
    Given a player named Bob
    And a player named Alice
    And Bob has a One Bam
    And Alice has a One Bam
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a double
    Then the action is rejected because Bob called for a double

  Scenario: Tiles cannot be called if the player doesn't have enough
    Given a player named Bob
    And a player named Alice
    And Bob does not have a One Bam
    And Bob does not have a Joker
    And ALice has a One Bame
    And it is Alice's turn to discard
    When Alice discards One Bam
    And Bob calls the discard for a pung
    Then the action is rejected because Bob called without tiles
