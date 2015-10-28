module Enumerable

	def my_each
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		j = 0
		for i in self
			yield(i, j)
			j += 1
		end
	end

	def my_select
		my_select_array = []
		self.my_each do |x|
			if yield(x) == true
				my_select_array << x
			end
		end
		return my_select_array.inspect
	end

	def my_all?
		self.my_each do |x|
			unless yield(x)
				return false
			end
		end
		return true
	end

	def my_any?
		self.my_each do |x|
			if yield(x)
				return true
			end
		end
		return false
	end

	def my_none?
		self.my_each do |x|
			if yield(x)
				return false
			end
		end
		return true		
	end

	def my_count
		elements = 0
		self.my_each do |x|
			if yield(x)
				elements += 1
			end
		end
		return elements
	end

	def my_map(the_proc=nil)
		if the_proc
			self.my_each_with_index do |x,y|
				self[y] = the_proc.call(x)
			end
		else
			self.my_each_with_index do |x, y|
				self[y] = yield(x)	
			end
		end
	end
	
	def my_inject(start=0)
		
		self.my_each do |x|
			start = yield(start, x)
		end
		return start
	end

end
