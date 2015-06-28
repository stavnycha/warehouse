Warehouse

There is warehouse with many employees who can add/edit/delete products to stock. Also there are
many categories of products. Such case is possible that one products belongs to many categories.
There should be possibility to add and remove new employees to the system. Product should
contain picture, description, price and whatever.


## Setup: ##

Firstly, you need to have Imagemagick installed.
The next step is to configure correctly config/database.yml using the template config/database.yml-example
Afterwards, run following commands: 


```
#!ruby

bundle install
rake db:setup

```

Seed data will create first user of the system.
Only existing users can add additional users to the system.