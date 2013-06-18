class RootController < ApplicationController

def index
	require 'net/http'
	require 'json'
	url = URI.parse('https://api.groupme.com/v3/bots/post')
	post_args = {"bot_id" => 'a6541a77a0b7606b469f3bc3e2', "text" => "Did someone say HOT TUB?!"}.to_json
	a = ActiveSupport::JSON.decode(post_args)
	text = params[:text].downcase
	if params[:name] != 'Kanye'
		if text["hot tub"] != nil
			resp, data = Net::HTTP.post_form(url, a)
		end
	end
end

end
