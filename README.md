Takeaway
________

A menu will contain a list of dishes and their prices. A customer can place an order detailing the dishes and the quantities they require, and the sum of the order.
If the customer has incorrectly calculated the sum of the order an error will be raised, otherwise the customer will receive a text message informing them when they can expect to receive their order.

The text message function will use the Twilio API


Classes
-------

* Menu
* Customer
* Order


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
