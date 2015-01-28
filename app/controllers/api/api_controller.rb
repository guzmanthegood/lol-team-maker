module Api

	class ApiController < ApplicationController

	def index
		#r = Faraday.get 'http://example.com'

		#@test = RiotApiConnector.test
		riot = RiotApiConnector.new
		riot.load_all_champions
		@test = "asf"
  end


	end
end