Feature: Add comment
  In order to test adding comments to article
  As a developer
  I want go to the home page and try to add comment to article

  Background:
    And article with name "Mongoid" exists
  
  Scenario: Add comment
   Given I am on the home page
   Then I should see "Listing articles"
   And I follow "Show"
   Then I should see "New Comment"
    And I fill in the following:
        | Name    | My first comment |
    And I press "Create Comment"
    Then I should see "Comment created!"
    And I should see "My first comment"
