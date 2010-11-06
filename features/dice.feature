Feature: Non-determinism in the fools

   As a Fools user,
   I expect this mod to behave
   as described by the game manual,
   with respect to non-determinism.

   # As yet I haven't done the maths to prove these work
   # However, these tests will prevent the game from crashing.
   Scenario: drink roll
      Given a hash of the dice rolls
      Given a roll is made for drunkenness 
      Then show the odds

   Scenario: combat roll
      Given a hash of the dice rolls
      Given a roll is made for combat
      Then show the odds

   Scenario: romantic resistance roll
      Given a hash of the dice rolls
      Given a roll is made for romance
      Then show the odds

   Scenario: talking sense roll
      Given a hash of the dice rolls
      Given a roll is made for sense
      Then show the odds
