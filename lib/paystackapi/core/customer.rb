module Customer
	def self.create_customer(body)
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::CUSTOMER_PATH}",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_customer
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