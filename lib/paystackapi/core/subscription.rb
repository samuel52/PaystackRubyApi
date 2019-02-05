module Subscription
	def self.create_subscription(body)
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_subscription
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_single_subscription(body)
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}" + "#{body}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.disable_subscription
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}/" + "disable",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.enable_subscription
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::SUBSCRIPTION_PATH}/" + "enable",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
end