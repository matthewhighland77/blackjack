#This took a while to understand.  I don't think I could have thought of it myself, well not yet...  

def sort my_array
	recursive_sort my_array, []
end

def recursive_sort unsorted_array, sorted
  if unsorted_array.length <= 0
    return sorted
  end

  smallest = unsorted_array.pop
  still_unsorted = []

  unsorted_array.each do |i|
    if i < smallest
      still_unsorted.push smallest
      smallest = i
    else
      still_unsorted.push i 
    end
  end

  sorted.push smallest
  recursive_sort still_unsorted, sorted
end

puts(sort(['can', 'small', 'sucks', 'friggin', 'apple']))



    
