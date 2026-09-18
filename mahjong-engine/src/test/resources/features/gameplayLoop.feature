Feature: The mahjong gameplay loop should follow the following:
  1. charleston
  2. discard | declare mahjong
  3. call
  4. draw (it is now the next player's turn)
  5. discard | joker swap | declare mahjong
  6. if joker swap, return to step 5. if discarded, return to step 3

  Scenario: After the charleston, it is the dealing player's turn to discard
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice deals
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      |  passes randomly  |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  |  passes randomly  |
      |        pass       |        pass       |        pass       |        pass       |
      |        pass       |        pass       |        pass       |        pass       |
    Then it is Alice's turn to discard

  Scenario: After discarding, other players get to call
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And it is Alice's turn to discard
    When Alice dicards
    Then it is the call phase

  Scenario: After calling, it is the next player's turn to draw
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And it is Alice's turn to discard
    When Alice dicards
    And the players perform the following:
      |        Bob        |       Carol       |        Dave       |
      |        pass       |        pass       |        pass       |
    Then it is Dave's turn to draw

  Scenario: After drawing, it is the player's turn to discard
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And it is Alice's turn to draw
    When Alice draws
    Then it is Alice's turn to discard

  Scenario: After joker swaping, it is still the player's turn to discard
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has a One Bam
    And Bob has an exposure of a kong of One Bams with 1 Joker
    And it is Alice's turn to discard
    When Alice swaps for Bob's One Bam
    Then it is Alice's turn to discard