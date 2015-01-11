
##Takeaway
_____________________

This was my personal weekend challenge for Week 2 of Makers Academy. The task was to create a takeaway system; whereby a customer could place an order, calculate the total, and if the total is correct would receive a text message informing them when their order would be delivered. My learning objectives were to consolidate my understanding ODD and the Solid Principles, and using RSpec for TDD.

##Tools Used
* Ruby
* Rspec
* Twilio


## Domain Model / CRC

A menu will contain a list of dishes and their prices. A customer can place an order detailing the dishes and the quantities they require, and the sum of the order.
If the customer has incorrectly calculated the sum of the order an error will be raised, otherwise the customer will receive a text message informing them when they can expect to receive their order.

The text message function will use the Twilio API


Collaborations
--------------

Menu                    | Collaborators
------------------------|-------------------
List dishes and prices  | Customer, Order


Customer                | Collaborators
------------------------|-------------------
Place order             | Menu, Order
Calculate total         | Menu, Order
Receive text            | Order

Order                   | Collaborators
------------------------|--------------------
Receive order           | Menu, Customer
Calculate total         | Menu
Send text               | Customer


Ultimately I ended up creating the following classes and modules:

Classes
-------

* Menu
* Order
* Takeaway (this was a wrapper class that initalized instances of menu and order)

Modules
-------

* Text (this module created the appropriate content of the SMS)
* Total (this module calculated the total of an order, and compared it to the customers estimate)
* Twilio (this is the twilio code that enables the SMS function)
___________________________

##How to use takeaway

To use in irb:
```shell
ruby takeaway.rb
```
To place an order:
```shell
takeaway.take_customer_order('onion bhaji')
```
To process the order:
```shell
takeaway.process_order(2.45)
```

_______________________________

##Issues faced

I started off writing my tests and making them pass. Concentrating first on the class that seemed the easiest to write and getting this finished before moving onto the next most simple class, etc. I ended up with tangled mess of code that violated all the SOLID principles, failed a lot of tests, and didn't work. I realised that I needed to get more comfortable with ODD and then revisit the code. After reading the first few chapters of Sandi Metz' ODD book I realised that I needed to make sure that my classes had a single responsibility, but that the methods within them also needed to have a single responsibility. I also realised that I needed to use dependency injection to sort out the dependency issues. I fixed these issues, but realised that I was no longer doing TDD. I therefore deleted the tests I'd written, commented out my code, and started again one test at a time. I am now much happier with the design of the code and it succeeds in both passing the tests and working.

##Future intentions

Whilst the design is much better, I feel like I need to spend much more time understanding good design and will come back to improve upon the code as I do. I think that some of the issues I had with design extend to the tests which I suspect are often trying to test too much.
