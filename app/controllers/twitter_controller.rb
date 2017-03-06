class TwitterController < ApplicationController
	before_action :connect_twitter_api

	def get_mentioned_info
		require 'json'
		@mentioned = @client.user(params[:mentioned])
		@followers_count = @mentioned.followers_count
		@following_count = @mentioned.friends_count
		@tweets_count = @mentioned.statuses_count
		result = {
			:followers_count => @followers_count,
			:following_count => @following_count,
			:tweets_count => @tweets_count
		}.to_json
		render json: result
	end

	def index
		@tweets = @client.user_timeline('casetabs').take(20)
	end

	def user
		user = params[:user]
		@tweets = @client.user_timeline(user).take(20)
		render 'index'
	end

	private

	def connect_twitter_api
		if Rails.env.development?
			Dotenv.load
		end
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['CONSUMER_KEY']
		  config.consumer_secret     = ENV['CONSUMER_SECRET']
		  config.access_token        = ENV['ACCESS_TOKEN']
		  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
		end
	end
end