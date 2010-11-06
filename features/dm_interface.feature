Feature: DM Interface
   As a Fools DM,
   I need control!

   Scenario: present user interface
      Given carps is initialized with test/server
      Given a DM test mailer
      Given a resource manager
      Given the DM mod for campaign detective 
      Given the DM user interface
      Then present the interface to the user
     
   Scenario: test DM inputs
      Given carps is initialized with test/server
      Given a DM test mailer
      Given a resource manager
      Given the DM mod for campaign detective
      Given the DM user interface
      Then test all the DM user inputs
