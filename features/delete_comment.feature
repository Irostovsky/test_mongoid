Feature: Delete comment
  In order to test deleting comments to article
  As a developer
  I delete comment from article

  Background:
    Given article with name "Mongoid" exists
    And comment with name "My first comment" exists
  
  Scenario: Delete comment
    Given I am on the home page
    And I follow "Show"
    Then I should see "My first comment"
    And I will confirm any popups
    And I follow "Delete"
    Then I should not see "My first comment"
    And I should see "Comment deleted!"
    
    
