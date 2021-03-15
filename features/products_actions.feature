Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: movies in database

  Given the following products exist:
  | name        | description | price     | stock | company_id  |
  | Star Wars   | PG          | 5         |   5   | 1           |

Scenario: View products
  When I go to the products page
  Then I should see "roducts"

Scenario: Add product to table
  When I go to the new product page
  And  I fill in "name" with "Ridley Scott"
  And  I fill in "description" with "Ridley Scott"
  And  I fill in "price" with "1"
  And  I fill in "stock" with "1"
  And  I press "Add Product"
  Then I should see "Ridley Scott"
