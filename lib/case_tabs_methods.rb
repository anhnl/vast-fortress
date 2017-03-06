module CaseTabsMethods

	class Sample

		def initialize(arbitrary_hash)
			@h = ActiveSupport::HashWithIndifferentAccess.new(arbitrary_hash)
		end

		def method_missing(name)
    	@h[name]
  	end

	end

	def zeros_count(n)
		binary = n.to_i.to_s(2)
		split = binary.split('1')

		split.max ? split.max.length : 0
	end

end