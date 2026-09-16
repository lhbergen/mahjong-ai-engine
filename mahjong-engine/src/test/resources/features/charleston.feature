Feature: Mahjong features the charleston phase which operates as follows
  Phase 1:
  Each player passes 3 tiles to their right (4 -> 3 -> 2 -> 1 -> 4)
  Each player passes 3 tiles opposite (1 <-> 3 | 2 <-> 4)
  Each player passes 3 tiles to their left (1 -> 2 -> 3 -> 4 -> 1)

  Any player may object to Phase 2, skipping it
  Phase 2:
  Each player passes 3 tiles to their left (1 -> 2 -> 3 -> 4 -> 1)
  Each player passes 3 tiles opposite (1 <-> 3 | 2 <-> 4)
  Each player passes 3 tiles to their right (4 -> 3 -> 2 -> 1 -> 4)

  Phase 3:
  Players may offer a courtesy swap of 1, 2, or 3 tiles with the player opposite them (1 <-> 3 | 2 <-> 4)

  At any point players may perform a blind swap on any number of tiles,
  opting to blindly pass the tiles they are about to receive

  Scenario: The charleston is executed, skipping phases 2 and 3
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |        pass       |        pass       |        pass       |        pass       |
      |        pass       |        pass       |        pass       |        pass       |
    Then Carol has 3 One Bams
    And the charleston is over

  Scenario: The charleston is executed, skipping phase 3
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |      continue     |      continue     |      continue     |      continue     |
      |  passes randomly  |  passes randomly  | passes 3 One Bams |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |        pass       |        pass       |        pass       |        pass       |
    Then Alice has 3 One Bams
    And the charleston is over

  Scenario: The charleston is executed completely and a 3 tile courtesy pass occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |      continue     |      continue     |      continue     |      continue     |
      |  passes randomly  |  passes randomly  | passes 3 One Bams |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |     continue 3    |        pass       |     continue 3    |        pass       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Carol has 3 One Bams
    And the charleston is over

  Scenario: The charleston is executed completely and a 2 tile courtesy pass occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |      continue     |      continue     |      continue     |      continue     |
      |  passes randomly  |  passes randomly  | passes 3 One Bams |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |     continue 2    |        pass       |     continue 2    |        pass       |
      | passes 2 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Carol has 2 One Bams
    And Alice has a One Bam
    And the charleston is over

  Scenario: The charleston is executed completely and a 1 tile courtesy pass occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |      continue     |      continue     |      continue     |      continue     |
      |  passes randomly  |  passes randomly  | passes 3 One Bams |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |     continue 1    |        pass       |     continue 1    |        pass       |
      | passes 1 One Bam  |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Carol has a One Bam
    And Alice has 2 One Bams
    And the charleston is over

  Scenario: The charleston is executed completely and the lesser tile courtesy pass occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |      continue     |      continue     |      continue     |      continue     |
      |  passes randomly  |  passes randomly  | passes 3 One Bams |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |     continue 1    |        pass       |     continue 3    |        pass       |
      | passes 1 One Bam  |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Carol has a One Bam
    And Alice has 2 One Bams
    And the charleston is over

  Scenario: The charleston is executed and non unanimous vote skips the second phase
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    And Alice has 3 One Bams
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      | passes 3 One Bams |  passes randomly  |  passes randomly  |  passes randomly  |
      |  passes randomly  |  passes randomly  |  passes randomly  | passes 3 One Bams |
      |  passes randomly  | passes 3 One Bams |  passes randomly  |  passes randomly  |
      |        pass       |      continue     |      continue     |      continue     |
      |        pass       |        pass       |        pass       |        pass       |
    Then Carol has 3 One Bams
    And the charleston is over

  Scenario: The charleston is executed and a blind pass of 3 occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      |   blind passes 3  |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Alice's hand has not changed
    And Bob's hand has changed

  Scenario: The charleston is executed and a blind pass of 2 occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      |   blind passes 2  |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Alice's hand has changed by 1 tile
    And Bob's hand has changed

  Scenario: The charleston is executed and a blind pass of 1 occurs
    Given players:
      | Alice |  Bob  | Carol | Dave  |
    When the charleston begins
    And the players perform the following:
      |       Alice       |        Bob        |       Carol       |        Dave       |
      |   blind passes 1  |  passes randomly  |  passes randomly  |  passes randomly  |
    Then Alice's hand has changed by 2 tiles
    And Bob's hand has changed