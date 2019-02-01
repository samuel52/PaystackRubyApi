class Transaction
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