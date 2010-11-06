Feature: launch player
   As a Drone-to-be,
   I require launching
   of this wonderful CARPS mod.

   Scenario: launch player
      Given a test player mailer
      Given carps is initialized with test/client
      Then launch the player interface
