# Flexibee [![Build Status](https://travis-ci.org/danpecher/flexibee.rb.svg?branch=master)](https://travis-ci.org/danpecher/flexibee.rb)

Ruby wrapper for Flexibee JSON REST API (docs to be found [here](https://www.flexibee.eu/api/dokumentace/))

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flexibee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flexibee

## Usage

### Connection

To get base client object for establishing connection do:

```
@user_id = 'USERID'
@login = 'LOGIN'
@password = 'PWD'
@company = 'COMPANY'

@flexibee = Flexibee::Client.new(@user_id, @login, @password, @company)
```

Then you can proceed to access data:

### Company

can be accessed by:

```ruby
company = @flexibee.company
```

it has attributes:

```ruby
company.info
company.id
company.name
company.db_name
company.created_at
```


### Invoice Types

can be accessed by:

```ruby
invoice_types = @flexibee.invoice_types
```

returns array of Flexibee::InvoiceType Structs

Flexibee::InvoiceType has attributes:

```ruby
invoice_types.first.id
invoice_types.first.updated_at
invoice_types.first.code
invoice_types.first.name
invoice_types.first.currency
invoice_types.first.currency_ref
invoice_types.first.currency_name
```

### Order Types

can be accessed by:

```ruby
order_types = @flexibee.order_types
```

returns array of Flexibee::OrderType Structs

Flexibee::OrderType has attributes:

```ruby
order_types.first.id
order_types.first.updated_at
order_types.first.code
order_types.first.name
order_types.first.currency
order_types.first.currency_ref
order_types.first.currency_name
```

### Product List

can be accessed by:

```ruby
product_list = @flexibee.product_list
```

returns Flexibee::ProductList and you can call `all` to get array of Flexibee::Product objects

```ruby
all_products = product_list.all
```

to iterate through products you can pass it params `start` and `limit`

```ruby
not_all_products = product_list.all({ start: 120, limit: 100})
```

`all_products` and `not_all_products` are now arrays of products and you can iterate through Flexibee::Product objects in it, it has these attributes:

```ruby
all_products.first.id
all_products.first.updated_at
all_products.first.code
all_products.first.name
all_products.first.price_base
all_products.first.price_no_vat
all_products.first.price_vat
all_products.first.stock
all_products.first.note
all_products.first.description
all_products.first.ean
all_products.first.vat
all_products.first.client
```

you can filter by id, name and ean to ease your work using these methods on product list:
(They return first match from your products -> Flexibee::Product)

```ruby
product_list.find_by_id(2345)
```

```ruby
product_list.find_by_name('My fancy product Blue/Red')
```

```ruby
product_list.find_by_ean('9343783000326')
```


### Tree (Categories of products - Flexibee 'strom')

Hard to find, you have to use desktop app to access these (is the tree on the left hand side in desktop app once on price list)

can be accessed by:

```ruby
tree = @flexibee.tree
```

returns Flexibee::Tree and you can call `all` to get array of Flexibee::Node objects

```ruby
nodes = tree.all
```

you can also access some additional custom sets of nodes for convenience:

to get root node call (returns Flexibee::Node):
```ruby
root = tree.root
```

to access all nodes on certain level (returns array of Flexibee::Node):
```ruby
nodes = tree.level(3)
```

you can lookup node by id (returns array of Flexibee::Node):
```ruby
nodes = tree.find_by_id(34)
```

### Node

to describe Flexibee::Node better (see Tree described above which is full of them)

once you get node from tree (example):
```ruby
node = @flexibee.tree.first
```

you can access these attributes:
```ruby
node.id
node.updated_at
node.code
node.name
node.level
node.order
node.route
node.short_description
node.keywords
node.description
node.tree_ref
node.parent_id
node.parent_ref
```

also you can display all descendants of the node (array of Flexibee::Node):
```ruby
desc = node.descendants
```

or you can display parent of the node (Flexibee::Node):
```ruby
parent = node.parent
```


## TODO

* raw for response (if I left out something you want to display)
* filtering for all
* invoices
* sending to flexibee


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flexibee. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
