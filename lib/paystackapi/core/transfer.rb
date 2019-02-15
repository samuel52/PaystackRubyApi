module Transfer
	def self.create_transfer_reciept(body)
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_transfer_reciept
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.update_transfer_reciept(body, trf_code)
		api = HTTParty.put("#{API::BASE_URL}" + "#{API::RECIPIENT_PATH}/" + "#{trf_code}",
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
	def self.list_transfers
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
end