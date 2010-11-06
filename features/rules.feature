Feature: Fools rules

   As a Fools user,
   I expect the mod to faithfully
   implement the rules as described
   in the Fools manual.

   Scenario: drinking odds
      Given a hash of the rules
      When the rule is drunkenness
      Given a character sheet for an ordinary drone
      Then show the odds for the drunk rule
      Given a character sheet for a drone with a high tolerance for alcohol
      Then show the odds for the drunk rule

   Scenario: drinking application
      Given a hash of the rules
      When the rule is drunkenness
      Given a character sheet for an ordinary drone
      Then apply the drunk rule
      Then display the character sheet

   Scenario: combat odds
      Given a hash of the rules
      When the rule is combat
      Given a character sheet for an ordinary drone
      Given also a character sheet for a fit drone
      Then show the odds for the combat rule

   Scenario: combat application
      Given a hash of the rules
      When the rule is combat
      Given a character sheet for an ordinary drone
      Given also a character sheet for a fit drone
      Then apply the combat rule
      Then display the character sheet

   Scenario: romantic resistance application
      Given a hash of the rules
      When the rule is romance
      Given a character sheet for an ordinary drone
      Given a character sheet for teh hawt wimenz
      Then apply the romance rule
      
   Scenario: romantic resistance odds
      Given a hash of the rules
      When the rule is romance
      Given a character sheet for an ordinary drone
      Given a character sheet for teh hawt wimenz
      Then show the odds for the romance rule

   Scenario: sense application
      Given a hash of the rules
      When the rule is sense
      Given a character sheet for an ordinary drone
      Given a character sheet for teh hawt wimenz
      Given also a character sheet for a fit drone
      Then apply the sense rule

   Scenario: sense odds
      Given a hash of the rules
      When the rule is sense
      Given a character sheet for an ordinary drone
      Given a character sheet for teh hawt wimenz
      Given also a character sheet for a fit drone
      Then show the odds for the sense rule
