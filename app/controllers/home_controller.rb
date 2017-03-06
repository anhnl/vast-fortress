class HomeController < ApplicationController

	include CaseTabsMethods
	def index
		@q1 = "{key:[[value_1, value_2],[value_3, value4]], 5:10:00AM]}"
		@expect_a1 = {"key" => [["value_1", "value_2"],["value_3", "value4"]], 5=>"10:00AM"}
		@a1 = format_hash(@q1)

		@q2 = {"this" => [1,2,3,4,5,6], "that" => ['here', 'there', 'everywhere'], :other => 'here'}
		@a2 = Sample.new(@q2)

		@q3 = 'Find largest zero gap'
		@a3 = zeros_count(1041)
	end

end