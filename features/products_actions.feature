Feature: search for movies by director

  As a merchant
  So that I can sell more items
  I want to list my products for sale

Background: products and companies in database

  Given the following companies exist:
  | name        | description | address                             | image_url | company_id  |
  | Test        | test        | 600 w 116th st, new york, ny 10027  |   "x"     | 1           |
  Given the following products exist:
  | pid | name        | description | price     | stock_count | company_id  |
  | 1   | Star Wars   | PG          | 5         |   5         | 1           |

Scenario: View products
  When I go to the products page
  Then I should see "roducts"
  And I should see "Star Wars"

Scenario: Add product to table
  # TODO: This should not work because we do not have
  # our merchant_id in session
  When I go to the new product page
  And  I fill in "product_name" with "Ridley Scott"
  And  I fill in "product_description" with "Ridley Scott"
  And  I fill in "product_price" with "1"
  And  I fill in "product_stock_count" with "1"
  And  I press "Add Product"
  Then product id 2 does not exist
