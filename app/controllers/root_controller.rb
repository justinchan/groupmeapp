class RootController < ApplicationController

def index
	require 'net/http'
	url = URI.parse('https://api.groupme.com/v3/bots/post')
	@post_args = {"bot_id" => 'fc1caa61bef8b652d64d3242d4', "text" => "derp"}.to_json
	#if params[:text] = 'hello'
		resp, data = Net::HTTP.post_form(url, post_args)
	#end
end

end
