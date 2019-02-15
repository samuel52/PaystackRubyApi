module Plan
	def self.create_plan(body)
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::PLAN_PATH}",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_plans
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::PLAN_PATH}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.list_single_plan(body)
		api = HTTParty.get("#{API::BASE_URL}" + "#{API::PLAN_PATH}" + "#{body}",
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
	def self.update_plan(body, plan)
		api = HTTParty.put("#{API::BASE_URL}" + "#{API::PLAN_PATH}/" + "#{plan}",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
end