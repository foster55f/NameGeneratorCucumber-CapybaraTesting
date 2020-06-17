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

  Scenario: User generates names for one category
    Given   I have selected "Uncheck all" button 
    When    I select "Centaur" category from available category checkboxes
    And     I click "Write me some fantasy names" 
    Then    I see the title "Best Suggestions"

  Scenario: User sees category in each name result
    Given   I have only selected the "Centaur" category 
    When    I click submit
    Then    I see that "centaur" is present in each name suggestion

  Scenario: User requests a human name suggestion
    Given   There is no human name suggestion
    When    I click the "Suggest" button for a human name
    Then    I see a human name has been added
    #Should this be here? Maybe it shouldn't be included in this scenario but instructions ask for this in Scenario 5
    Then    I click submit form

  Scenario: Human name is included at least once in name results
    Given   A human name has been suggested 
    And     The form has been submitted
    Then    The human first or last name is included in at least one name result


  
