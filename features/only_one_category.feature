Feature: One category selected

Background: 
    Given   I have selected "Uncheck all" button 
    And     I select "Centaur" category from available category checkboxes

Scenario: User generates names for one category
    And     I click "Write me some fantasy names" 
    Then    I see the title "Best Suggestions"

Scenario: User sees category in each name result
    When    I click submit
    Then    I see that "centaur" is present in each name suggestion