class RootController < ApplicationController

	def index
		require 'net/http'
		require 'json'
		text = params[:text].downcase
		if params[:name] != 'Kanye'
			if text["hot tub"] != nil
				if text.split(" ").include?('hot') and text.split(" ").include?('tub')
					url = URI.parse('https://api.groupme.com/v3/bots/post')
					post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "Did someone say HOT TUB?!"}.to_json
					a = ActiveSupport::JSON.decode(post_args)
					resp, data = Net::HTTP.post_form(url, a)
				end
			elsif text["specialties"] != nil
				url = URI.parse('https://api.groupme.com/v3/bots/post')
				post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "Kanye approves of your choice of place to eat."}.to_json
				a = ActiveSupport::JSON.decode(post_args)
				resp, data = Net::HTTP.post_form(url, a)
			end
		end
	end

end
