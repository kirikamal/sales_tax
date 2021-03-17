# Sales::Tax

## Coding Challenge

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical
products that are exempt. Import duty is an additional sales tax applicable on all imported
goods at a rate of 5%, with no exemptions.

When I purchase items, I receive a receipt that lists the name of all the items and their price
(including tax), finishing with the total cost of the items, and the total amounts of sales taxes
paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains
(np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets; this
application should be written in Ruby [1] and use Rspec [2] to test inputs and the expected
outputs. The output should be to standard out or CSV. The application is to be shared via a
Github [3] repository link.

Proper object orientated design is important. Each row in the input represents a line item of
the receipt.


## To run the project
1. Run
  ```
  $ ruby entry_point.rb
  ```

2. Enter item one by one and press `Enter` twice to execute the project.

    - 1, book, 12.49
    - 1, music cd, 14.99
    - 1, chocolate bar, 0.85
    - 1, imported box of chocolates, 10.00
    - 1, imported bottle of perfume, 27.99


## Test the project
  Run
  ```
  $ rspec spec
  ```


## Assumptions

1. Quantity & Price are positive whole numbers
2. Imported items should have a word 'imported' in them