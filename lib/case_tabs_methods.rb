module CaseTabsMethods

	def format_hash(h)
		finding_key = true
		finding_val = false
		key = ''
		val = ''
		last_key = ''
		last_val = ''
		unclosed_count = 0
		closed_count = 0
		hash = {}
		arr = []
		h.each_char.with_index do |c, i|
			# If is a letter or digit or underscore
			if (c =~ /[A-Za-z0-9_]/) == 0

				# Previous char is a symbol
				if (h[i-1] =~ /[A-Za-z0-9_]/) != 0 && h[i-1] != '[' && h[i-1] != ']'
					last_key = key
					last_val = val
					key = ''
					val = ''
				end
				key.concat(c) if finding_key
				val.concat(c) if finding_val

			# If is a symbol
			else
				if c == '['
					if finding_val
						unclosed_count += 1
					end
				elsif c == ']'
					if finding_val
						closed_count += 1
					end
				end
				# Previous char is a letter or digit or underscore
				if (h[i-1] =~ /[A-Za-z0-9_]/) == 0
					if finding_key
						finding_key = false
						finding_val = true
						hash[key] = val
					else
						if unclosed_count > 0
							if unclosed_count > closed_count
								arr << val
							elsif unclosed_count == closed_count
								finding_key = true
								finding_val = false
								unclosed_count = 0
								closed_count = 0
								hash[last_key] = arr
								arr = []
							end
						else
							finding_key = true
							finding_val = false
							hash[last_key] = val
						end
					end
				end
			end
		end
		return hash
	end

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