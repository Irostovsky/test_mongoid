Given /^article with name "(.*)" exists$/ do |article_name|
  steps <<-EOS
    Given I am on the home page
    Then I should see "Listing articles"
    And I follow "New Article"
    Then I should see "New article"
    And I fill in the following:
       | Name    | #{article_name} |
       | Content | It is awesome!  |
    And I press "Create Article"
    Then I should see "Article was successfully created." 
  EOS
end