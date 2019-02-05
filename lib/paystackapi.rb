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
			Transaction.create_customer(body)
		end
		def self.list
			Transaction.list_customer
		end
		def self.list_single(body)
			Transaction.fetch_a_customer(body)
		end
	end

	class PaystackPlans
		def self.create(body)
			Transaction.create_plan(body)
		end
		def self.list
			Transaction.list_plans
		end
		def self.list_single(body)
			Transaction.list_single_plan(body)
		end
		def self.update(body)
			Transaction.update_plan(body)
		end
	end


	class PaystackSubscription
		def self.create(body)
			Transaction.create_subscription(body)
		end
		def self.list
			Transaction.list_subscription
		end
		def self.list_single(body)
			Transaction.list_single_subscription(body)
		end
		def self.disable
			Transaction.disable_subscription
		end
		def self.enable
			Transaction.enable_subscription
		end
	end

	class PaystackTransfer
		def self.generate(body)
			Transaction.create_transfer_reciept(body)
		end
		def self.list_reciept
			Transaction.list_transfer_reciept
		end
		def self.update_reciept(body, trf_code)
			Transaction.update_transfer_reciept(body)
		end
		def self.initailize(body)
			Transaction.init_transfer(body)
		end
		def self.list_transfer
			Transaction.list_transfers
		end
		def self.finalize(body)
			Transaction.finalize_transfers(body)
		end
	end

	class PaystackBank
		def self.list_banks
			Transaction.banks
		end
	end
end

