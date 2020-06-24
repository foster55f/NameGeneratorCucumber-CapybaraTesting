Feature: Human name suggested

Background: 
    Given   There is no human name suggestion
    And     I click the "Suggest" button for a human name
    And     A human name has been suggested 
    
Scenario: User requests a human name suggestion   
    Then    I see a human name has been added
    #Should this be here? Maybe it shouldn't be here but instructions ask for this in Scenario 5
    Then    I click submit form

Scenario: Human name is included at least once in name results
    When    The form is submitted
    Then    The human first or last name is included in at least one name result