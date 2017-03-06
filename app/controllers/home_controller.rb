class HomeController < ApplicationController

	include CaseTabsMethods
	def index
		@q2 = {"this" => [1,2,3,4,5,6], "that" => ['here', 'there', 'everywhere'], :other => 'here'}
		@a2 = Sample.new(@q2)

		@q3 = 'Find largest zero gap'
		@a3 = zeros_count(1041)
	end

end