module Otp
	def self.resend_otp(body)
		api = HTTParty.post("#{API::BASE_URL}" + "#{API::TRANSFER_PATH}" + "/resend_otp",
			:body => body.to_json,
			:headers => { "Authorization"=> ENV["PAYSTACK_SECRET_KEY"], "content-type" => "application/json"})
		return api
	end
end