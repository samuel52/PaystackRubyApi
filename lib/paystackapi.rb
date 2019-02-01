require 'paystackapi/version'
require 'paystackapi/base.rb'
require 'httparty'
require 'openssl'
require 'dotenv'

module Paystackapi
	class PaystackTransactions
		def self.verify_payment(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::TRANSACTION_PATH}" + "/verify/#{body}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_transactions()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::TRANSACTION_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_transaction_totals()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::TRANSACTION_PATH}/" + "totals",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.fetch_transaction(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::TRANSACTION_PATH}/" + "#{body}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.charge_authorization(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::TRANSACTION_PATH}/" + "charge_authorization",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
	end
	class PaystackCustomers
		def self.create_customer(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::CUSTOMER_PATH}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_customer()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::CUSTOMER_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.fetch_a_customer(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::CUSTOMER_PATH}/" + "#{body}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
	end

	class PaystackPlans
		def self.create_plan(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::PLAN_PATH}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_plans()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::PLAN_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_single_plan(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::PLAN_PATH}" + "#{body}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.update_plan(body)
			api = HTTParty.put("#{API::BASE_URL}" + "#{API::PLAN_PATH}" + "#{body}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
	end


	class PaystackSubscription
		def self.create_subscription(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_subscription()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_single_subscription(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}" + "#{body}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.disable_subscription()
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}/" + "disable",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.enable_subscription()
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}/" + "enable",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end

	end

	class PaystackTransfer
		def self.create_transfer_reciept(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_transfer_reciept(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.update_transfer_reciept(body, trf_code)
			api = HTTParty.put("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}" + "#{trf_code}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.init_transfer(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::TRANSFER_PATH}",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.list_transfers(body)
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::TRANSFER_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.finalize_transfers(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::TRANSFER_PATH}" + "/finalize_transfer",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
		def self.resend_otp(body)
			api = HTTParty.post("#{API::BASE_URL}" + "#{API::TRANSFER_PATH}" + "/resend_otp",
				:body => body.to_json,
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end

	end

	class PaystackBank
		def self.banks()
			api = HTTParty.get("#{API::BASE_URL}" + "#{API::BANK_PATH}",
				:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
			return api
		end
	end
end

