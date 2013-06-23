class RootController < ApplicationController

	def index
		require 'net/http'
		require 'json'
		text = params[:text].downcase
		if params[:name] != 'Kanye'
		# 	if text["hot tub"] != nil
		# 		if text.split(" ").include?('hot') and text.split(" ").include?('tub')
		# 			url = URI.parse('https://api.groupme.com/v3/bots/post')
		# 			post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "Did someone say HOT TUB?!"}.to_json
		# 			a = ActiveSupport::JSON.decode(post_args)
		# 			resp, data = Net::HTTP.post_form(url, a)
		# 		end
			if text == 'kanye weather'
				url = URI.parse('https://api.forecast.io/forecast/e9ae28050324270567556f2425a62c3f/37.6933,-121.9241?exclude=[minutely,hourly,daily,alerts,flags]')
				resp_unparsed = Net::HTTP.get_response(url)
				resp = JSON.parse resp_unparsed.body
				current_weather = resp["currently"]
				temp = current_weather["temperature"]
				if temp < 60
					message = "it's colder than the reception I got after the VMAs!"
				elsif temp >= 60 and temp < 75
					message = "the weather is fine, just like me. Kanye is so fine."
				else
					message = "DAMNN IT'S HOT OUTSIDE!"
				end
				summary = current_weather["summary"]
				summary.downcase!
				post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "#{temp} degrees outside - #{summary}. In Kanye's words, #{message}"}.to_json
				url = URI.parse('https://api.groupme.com/v3/bots/post')
				a = ActiveSupport::JSON.decode(post_args)
				resp, data = Net::HTTP.post_form(url, a)
			elsif text == 'kanye awards ceremony' and params[:name] == 'Justin Chan'
				system "rake tabulate &"
				url = URI.parse('https://api.groupme.com/v3/bots/post')
				post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "Tabulating results..."}.to_json
				a = ActiveSupport::JSON.decode(post_args)
				resp, data = Net::HTTP.post_form(url, a)
			end
		# 	elsif text["thanks kanye"] != nil
		# 		first_name_temp = params[:name]
		# 		first_name = first_name_temp.split(" ").first
		# 		url = URI.parse('https://api.groupme.com/v3/bots/post')
		# 		post_args = {"bot_id" => 'ef2a6aea6ec1d4d06d7727cbe9', "text" => "Kanye always got your back, #{first_name}."}.to_json
		# 		a = ActiveSupport::JSON.decode(post_args)
		# 		resp, data = Net::HTTP.post_form(url, a)
		# 	end
		end
	end

end
