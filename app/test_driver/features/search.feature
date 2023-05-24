Feature: Browse items

  Scenario: Search for a non-existing item
    Given the "Search" page
    When I enter "***" in the search bar
    And I click on the search button
    Then I should see a message saying "No items found"