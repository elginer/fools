Feature: launch player
   As a seriously minded Dungeon Master 
   I require launching
   of this wonderful CARPS mod.

   Scenario: launch DM
      Given a DM test mailer
      Given a campaign called snarkle
      Given carps is initialized with test/client
      Then launch the DM interface
