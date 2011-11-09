Feature: Add article
  In order to test adding article
  As a developer
  I want go to the home page and try to add article

  Scenario: Add article
    Given I am on the home page
    Then I should see "Listing articles"
    And I follow "New Article"
    Then I should see "New article"
    And I fill in the following:
      | Name    | Mongoid         |
      | Content | It is awesome!  |
    And I press "Create Article"
    Then I should see "Article was successfully created." 

  Scenario: Check errors on adding article
   Given I am on the home page
   Then I should see "Listing articles"
   And I follow "New Article"
   Then I should see "New article"
   And I press "Create Article"
   Then I should see "New article"
   And I should see "Name can't be blank" 

