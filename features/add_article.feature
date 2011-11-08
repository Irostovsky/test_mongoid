Feature: Add article
  In order to test adding article
  As a developer
  I want go to the home page and try to add article

  Scenario: Add article
    And article with name "Mongoid" exists

  Scenario: Check errors on adding article
   Given I am on the home page
   Then I should see "Listing articles"
   And I follow "New Article"
   Then I should see "New article"
   And I press "Create Article"
   Then I should see "New article"
   And I should see "Name can't be blank" 

