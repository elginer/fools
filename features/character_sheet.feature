Feature: Character sheet schema
   As Fools users,
   in order to exploit the features of CARPS,
   The Fools needs to have a character sheet schema.

   Scenario: valid sheet
      Given the Fools' verifier 
      When a valid sheet is provided
      Then accept the character sheet
   
   Scenario: syntactically invalid sheet
      Given the Fools' verifier
      When a syntactically invalid sheet is provided 
      Then do not accept the character sheet

   Scenario: out of bounds sheet
      Given the Fools' verifier
      When an out of bounds sheet is provided
      Then do not accept the character sheet

   Scenario: sheet on limit
      Given the Fools' verifier
      When a character sheet using exactly 8 character points is provided
      Then accept the character sheet

   Scenario: sheet out of limit
      Given the Fools' verifier
      When a character sheet using more than 8 character points is provided
      Then do not accept the character sheet

   Scenario: sheet under limit
      Given the Fools' verifier
      When a character sheet using less than 8 character points is provided
      Then accept the character sheet
      
