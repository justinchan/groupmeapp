class ManualController < ApplicationController
	def index
	end

	def post
		require 'net/http'
		require 'json'
		message = params[:kanye][:text]
		url = URI.parse('https://api.groupme.com/v3/bots/post')
		post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "#{message}"}.to_json
		a = ActiveSupport::JSON.decode(post_args)
		resp, data = Net::HTTP.post_form(url, a)
		redirect_to manual_path
	end
end
