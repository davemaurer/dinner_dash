# dinner_dash

Found at:

https://arcane-forest-8532.herokuapp.com/items

## Technical Specs:

* **Rails** App running on a **Heroku** server with a **PostgreSQL** database.
* Foundation based front end with custom css overrides.

## Purpose: Food menu item order system with user and administrator features

###App provides a user nav bar interface for:

* Ordering menu items 
* Adding and removing menu items to/from a cart 
* Checking out, but only if they are an existing user, and they are logged in

###Administrators can access the following pages via nav bar links:

**Order** page gives information including items, prices, status(ordered, paid, cancelled, completed)
  * Orders can be filtered by status and order status can be changed depending on the current status
  * Orders can be clicked on for details including current status, date/time placed, items ordered, purchaser name, and total price

**Menu** page displays all menu items 
  * Menu items can be added and edited, including retiring an item which hides it from the normal user view

**Categories** page allows admin to create new menu item categories

**Home** page allows admin to change name, username, and email
