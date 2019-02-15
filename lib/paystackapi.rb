require 'paystackapi/core/version'
require 'paystackapi/core/base.rb'
require 'paystackapi/core/transaction.rb'
require 'paystackapi/core/bank.rb'
require 'paystackapi/core/customer.rb'
require 'paystackapi/core/otp.rb'
require 'paystackapi/core/plan.rb'
require 'paystackapi/core/transfer.rb'
require 'paystackapi/core/subscription.rb'
require 'httparty'
require 'dotenv'

module Paystackapi
	class PaystackTransactions
		def self.verify(body)
			Transaction.verify_payment(body)
		end
		def self.list
			Transaction.list_transactions
		end
		def self.totals
			Transaction.list_transaction_totals
		end
		def self.list_single(body)
			Transaction.fetch_transaction(body)
		end
		def self.charge(body)
			Transaction.charge_authorization(body)
		end
	end
	class PaystackCustomers
		def self.create(body)
			Customer.create_customer(body)
		end
		def self.list
			Customer.list_customer
		end
		def self.list_single(body)
			Customer.fetch_a_customer(body)
		end
	end

	class PaystackPlans
		def self.create(body)
			Plan.create_plan(body)
		end
		def self.list
			Plan.list_plans
		end
		def self.list_single(body)
			Plan.list_single_plan(body)
		end
		def self.update(body, plan)
			Plan.update_plan(body, plan)
		end
	end


	class PaystackSubscription
		def self.create(body)
			Subscription.create_subscription(body)
		end
		def self.list
			Subscription.list_subscription
		end
		def self.list_single(body)
			Subscription.list_single_subscription(body)
		end
		def self.disable(body)
			Subscription.disable_subscription(body)
		end
		def self.enable(body)
			Subscription.enable_subscription(body)
		end
	end

	class PaystackTransfer
		def self.generate(body)
			Transfer.create_transfer_reciept(body)
		end
		def self.list_reciept
			Transfer.list_transfer_reciept
		end
		def self.update_reciept(body, trf_code)
			Transfer.update_transfer_reciept(body, trf_code)
		end
		def self.initailize(body)
			Transfer.init_transfer(body)
		end
		def self.list_transfer
			Transfer.list_transfers
		end
		def self.finalize(body)
			Transfer.finalize_transfers(body)
		end
	end

	class PaystackBank
		def self.list_banks
			Bank.banks
		end
	end
end

