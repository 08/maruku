

# Any method that detects formatting error calls the
# error() method. 
# if @meta[:on_error] == 
#
# - :warning   write on the standard err (or @error_stream if defined), 
#              then do your best.
# - :ignore    be shy and try to continue
# - :raise     raises a MarukuException
#
# default is :raise

class MarukuException < RuntimeError
	
end

class MDElement
	Default_on_error = :raise
	
	def maruku_error(s,src=nil,con=nil)
		policy = @doc ? (@doc.meta[:on_error] || Default_on_error) : :raise
		
		case policy
		when :ignore 
		when :raise
			raise_error describe_error(s,src,con)
		when :warning
			tell_user describe_error(s,src,con)
		end
	end
	
	alias error maruku_error

	def raise_error(s)
		raise MarukuException, s, caller
	end

	def tell_user(s)
		(@error_stream || $stderr) << "\n" << s << "\n"
	end
	
	def set_error_stream(os)
		@error_stream = os
	end

	def describe_error(s,src,con)
		t = s
		if src
			t += "\n #{src.describe} \n"
		end
		if con
			t += "\n #{con.describe} \n"
		end
		t
	end
	
end






