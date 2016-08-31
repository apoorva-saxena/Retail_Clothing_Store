#Retail Store

Heroku Link: https://retail-clothing-store.herokuapp.com/products

A website used for selling clothes and footwears

The website displays all the products, the user can add products to his cart and apply suitable vouchers to get some discounts on the final bill.

The list of products and vouchers were supplied beforehand.


The initial Products page (If a product gets out of stock the button is automatically disabled)
![Image1](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/1.png)

The carts page
![Image2](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/2.png)

Voucher applied successfully!
![Image3](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/3.png)

Voucher not applicable for the product!
![Image4](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/4.png)


##User Stories

* As a User I can add a product to my shopping cart.
* As a User I can remove a product from my shopping cart.
* As a User I can view the total price for the products in my shopping
cart.
* As a User I can apply a voucher to my shopping cart.
* As a User I can view the total price for the products in my shopping cart
with discounts applied.
* As a User I am alerted when I apply an invalid voucher to my shopping
cart.
* As a User I am unable add Out of Stock products to the shopping cart.


##Technologies Used

* Ruby on Rails
* JQuery for frontend
* Rspec and Capybara for testing
* Erb(templating engine)
* Javascript  
* Bootstrap
* CSS and HTML

##How to run the app

```
git clone git@github.com:apsaxena24/Retail_Clothing_Store.git
cd Retail_Clothing_Store
bundle
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
bin/rails s
open http://localhost:3000
```

##How to run tests

```
rspec
```

## Code layout

The code is structured as a standard ruby on rails app and the notable files/folders with descriptions are:

* app/controllers:   
  carts_controller.rb (Calculates the count and bill of the cart and has methods to render/add-items/remove-items from cart
  products_controller.rb (Controller for the home page. Used for rendering the products page)
  vouchers_controller.rb (Controller/logic for the vouchers which is generic)

* app/helpers:
  products_helper.rb (Is used by the views for product to get the count of products)

* app/models:
  voucher.rb: (Has utility functions that are called by the voucher controller.)

* app/views:
  carts/index.html.erb: (Has the erb + html logic for the view of the cart.)
  products/index.html.erb: (Has the erb + html logic for the view of the products.)

* db:
  schema.rb: (Has the schema of the website. Namely product and vouchers.)
  seeds.rb: (Has the seed data for the database)

* spec
  /features: All feature tests for this project
  /models:Tests for the models: Product and Voucher individually.
  /web_helpers.rb: Helper functions for the tests.

## Brief Overview

### The main aims were:  
* To make the website simple, stable and functional. 
* Make the Voucher logic generic and extendable. 
* Not to over-engineer the cart logic. 
* Avoid using heavy frontend frameworks and use minimal jquery when required. 
* Render most of the code from the backend using simple templating in rails. 
* Fully cover all the features with feature tests and unit tests for the models. 

### Decisions:
* Why ruby on rails? Because the project fitted neatly into a MVC paradigm and Rails helps generate the skeleton of the app helping us to not re-invent the wheel. It is also a very mature framework and quite stable.

* Why jquery and minimal javascript? Because most of the website is rendered from the backend and only small things (for example incrementing the cart count) were done in jquery.
  
* Why have a model for vouchers? This makes it easily extendable, and the logic does not hardcode any voucher features in any place. Thus we can just add more rows to the voucher table (even an xml/flat file should have worked, but I already had a db so used that) and it will display and work by itself
  
* Why store cart in the session? Like most ecommerce websites, it makes sense to persist items for repeat visits of customers even when they are logged in. If we just stored it in memory the data would have been lost on the second visit. Sessions are inherently simple to use in rails and can be just used as a dictionary (session[:cart] in our case). When the count of each product is needed we just loop through this and get the count map.
  
* Why Capybara and rspec? Well integrated with ruby on rails and allows for more human-readable yet powerful tests. 
  
