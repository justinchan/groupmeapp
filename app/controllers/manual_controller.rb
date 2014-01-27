class ManualController < ApplicationController
	def index
	end

	def post
		require 'net/http'
		require 'json'
		message = params[:kanye][:text]
		url = URI.parse('https://api.groupme.com/v3/bots/post')
		post_args = {"bot_id" => '1ac7158d3e349fdd6174bc11e4', "text" => "#{message}"}.to_json
		a = ActiveSupport::JSON.decode(post_args)
		resp, data = Net::HTTP.post_form(url, a)
		redirect_to manual_path
	end
end
