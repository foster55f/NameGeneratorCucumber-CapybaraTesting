Feature: An Example Feature

  Scenario: An example scenario
    Given   I am on the fantasy name page
    Then    I see the text "Find the Perfect Fantasy Name"

  Scenario: User visits the Fantasy Name Generator
    Given   I am on the expected page
    Then    I see the current path as "https://www.name-generator.org.uk/fantasy/"

  Scenario: User generates names
    When    I fill in "How many examples of each type would you like to generate?" with 10
    And     I click "Write me some fantasy names" button
    Then    I see that number of name results

  


  
