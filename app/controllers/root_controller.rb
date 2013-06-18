class RootController < ApplicationController

def index
	require 'net/http'
	url = URI.parse('https://api.groupme.com/v3/bots/post')
	post_args = {"fc1caa61bef8b652d64d3242d4" => params[:bot_id], "hello word" => params[:text]}
	#if params[:text] = 'hello'
		resp, data = Net::HTTP.post_form(url, post_args)
	#end
end

end

