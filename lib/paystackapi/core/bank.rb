module Bank
	def self.banks
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::BANK_PATH}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
end