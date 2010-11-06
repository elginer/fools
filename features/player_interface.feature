Feature: Player Interface
   As a Fools Player,
   I need to speak to the DM,
   And do other things too!

   Scenario: present user interface
      Given carps is initialized with test/client
      Given a test player mailer
      Given the Player mod 
      Given the Player user interface
      Then present the interface to the user

   Scenario: test player inputs
      Given carps is initialized with test/server
      Given a test player mailer
      Given the Player mod
      Given the Player user interface
      When a character sheet is provided for the player 
      Then test all the Player user inputs
