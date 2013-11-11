

require 'pry'

def shuffle arr
	shuf = []
	while arr.length > 0
		rand_index = rand(arr.length)
		curr_index = 0
		new_arr = []

		arr.each do |i|
			if curr_index == rand_index
				shuf.push i
			else
				new_arr.push i
			end
		
		  curr_index = curr_index + 1
	end
		arr = new_arr
  end
	shuf
end

puts(shuffle([1,2,3,4,5,6,7,8,9,10]))
