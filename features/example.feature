Feature: An Example Feature

  Scenario: An example scenario
    Given   I am on the fantasy name page
    Then    I see the text "Find the Perfect Fantasy Name"

  Scenario: On the expected page
    Given   I am on the expected page for the Fantasy Name Generator
    Then    I see the current path as 'https://www.name-generator.org.uk/fantasy/'

  Scenario: Select a number of name examples
    When    I fill in How many examples of each type would you like to generate? with 10
    And     I click "Write me some fantasy names" button
    Then    I see 10 name suggestions

  Scenario: Select only one name category
    When    I select 'Uncheck all' button 
    And     I select 'Centaur' category from available category checkboxes
    And     I click "Write me some fantasy names" 
    Then    I see the title 'Best Suggestions'

  Scenario: Expect selected category present in every suggestion
    Given   I have only selected the "Centaur" category 
    Given   I click submit
    Then    I see that "centaur" is present in each name suggestion

  Scenario: Click suggest button to add human name 
    Given   Human name input field is empty
    When    I click "Suggest" button for a human name
    And     I see a human name has been added
    Then    I click submit form

  Scenario: Human name is included at least once in name suggestions
    Given   Human name has been added 
    Given   Form has been submitted
    Then    A name suggestion includes first or last human name


  
