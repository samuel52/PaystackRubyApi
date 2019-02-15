# Paystackapi :moneybag:
[![CircleCI](https://circleci.com/gh/samuel52/PaystackRubyApi.svg?style=shield)](https://circleci.com/gh/samuel52/PaystackRubyApi)
[![Gem Version](https://badge.fury.io/rb/paystackapi.svg)](https://badge.fury.io/rb/paystackapi)

Paystack gem for Ruby api only application
### Installation

Simply add this line to your application's Gemfile:

```ruby
gem 'paystackapi'
```

And then execute:
```ruby
 bundle install
```

Or install it yourself as:
```ruby
gem install paystackapi
```

### Usage

You may need to install [Dotenv](https://github.com/bkeepers/dotenv) to set you environmental variables. Set the requirements in your controller files where needed.

```ruby
require 'paystackapi'
require 'dotenv/load'
```

###  Transactions :credit_card:
###### Verify Payment 

```ruby

def validate_payment
 paystack_ref = params[:reference_code] # get payment ref after initializing payment from the frontend
 verify = Paystackapi::PaystackTransactions.verify(paystack_ref)
end
```
###### Other Transaction Methods :point_down:

```ruby
 Paystackapi::PaystackTransactions.list # list all transactions
 Paystackapi::PaystackTransactions.totals # show transaction totals
 Paystackapi::PaystackTransactions.list_single(arg) # list single transaction
 Paystackapi::PaystackTransactions.charge(arg) # charge authorization from card
```
### Customers :two_men_holding_hands:

```ruby
def customers
 customerEmail =  params[:customer_email]
 customer = Paystackapi::PaystackCustomers.create(customerEmail)
end
```
###### Other Customer Methods

```ruby
 Paystackapi::PaystackCustomers.list #list all customers
 Paystackapi::PaystackCustomers.list_single(arg) #get by id
```
### Plans :cyclone:

```ruby
def plans
  createPlan = {
	CustomerName = params[:name]
	interval = params[:interval]
	amount = params[:amount]
  }
  customer = Paystackapi::PaystackPlans.create(createPlan)
end
```
###### Other Plans Methods

```ruby
 Paystackapi::PaystackPlans.list #list all paystack plans
 Paystackapi::PaystackPlans.list_single(arg) #get by id
 Paystackapi::PaystackPlans.update(arg) #update plan by id
 ```
### Subscription :electric_plug:
```ruby
def subscription
  createSub = {
	CustomerToken = "CUS_xnxdt6s1zg1f4nx"
	planCode = "PLN_gx2wn530m0i3w3m"
  }

customer = Paystackapi::PaystackSubscription.create(createSub)
end
```
###### Other Subcription Methods

```ruby
 Paystackapi::PaystackSubscription.list #list all subs
 Paystackapi::PaystackSubscription.list_single(arg) #get subs by id
 Paystackapi::PaystackSubscription.disable #disable subs
 Paystackapi::PaystackSubscription.enable #enable subs
 ```
### Paystack Transfer :boom:
```ruby
def transfer
  createTrans = {
   type = "nuban" #use params[:something] to get the parameters from your endpoint
   name = "Raz"
   description = "Razite"
   account_number = "01000000419"
   bank_code = "044"
   currency = "NGN"
  }
  transfer = Paystackapi::PaystackTransfer.generate(createTrans)
end
```
###### Other Transfer Methods

```ruby
 Paystackapi::PaystackTransfer.list_reciept #list all transfers Reciept
 Paystackapi::PaystackTransfer.update_reciept(arg, arg) #update reciept 
 Paystackapi::PaystackTransfer.initailize(arg) #initalize a transfer (triggers an otp here)
 Paystackapi::PaystackTransfer.list_transfer #list all transfers
 Paystackapi::PaystackTransfer.finalize(arg) #finalize a transfer

 ```
### Bank List :bank:
```ruby
Paystackapi::PaystackBank.list_banks #list all Nigerian Banks
```

### Contributing

Please feel free to fork this package and contribute by submitting a pull request to enhance the functionalities.

### Who are you?

I'm Sam, find me on [twitter](https://twitter.com/sammyngn).

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).



