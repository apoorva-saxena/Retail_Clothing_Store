#Retail Store

An website used for selling clothes and footwears

The website displays all the products, the user can add products to his cart and apply suitable vouchers to get some discounts on the final product

The list of products and vouchers were supplied beforehand.

![Image1](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/1.png)

![Image2](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/2.png)

![Image3](https://raw.githubusercontent.com/apsaxena24/Retail_Clothing_Store/master/screenshots/3.png)

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
