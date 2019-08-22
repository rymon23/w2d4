require "byebug"

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
def my_min(list)
  current_min = nil #o(1)
  list.each_with_index do |el, i| #O(n)
    list.each_with_index do |el2, j| #O(n)
      if j > i #O(1)
        current_min ||= el #O(1)
        current_min = (current_min < el2) ? current_min : el2 #O(1)
        current_min = (current_min < el) ? current_min : el #O(1)
      end
    end
  end
  current_min #O(1)
end


# p my_min(list)


def my_min2(list)
  list.inject do |acc, el| #O(n)
    if acc < el #O(1)
      acc #O(1)
    else
      el #O(1)
    end
  end
end

# p my_min2(list)

# def largest_contiguous_subsum(list) 
#   max_sum = nil
#   (0...list.length - 1).each do |i|
#     (i...list.length).each do |j|
#       # debugger
#       subarr = list[i..j]
#       sum = subarr.sum
#       max_sum ||= sum

#       if max_sum < sum
#         max_sum = sum
#       end
#     end
#   end
#   max_sum
# end

def largest_contiguous_subsum(list) 
  max_sum = nil #O(1)
  sub_arr_holder = [] #O(1)
  (0...list.length - 1).each do |i| #O(n)
    (i...list.length).each do |j| #O(n)
      subarr = list[i..j] #O(n) 
      sub_arr_holder << subarr #O(1)  ?????? 
    end
  end

  sub_arr_holder.inject do |acc, arr| #O(n) + #O(1) + #O(1)
    if acc.sum > arr.sum #O(n) + #O(n) + #O(1)
      acc #O(1)
    else
      arr #O(1)
    end  
  end.sum #O(n)

end


def largest_contiguous_subsum(list) 
  largest = nil #O(1)
  running = nil #O(1)
  list.each do |el| #O(n)
    largest ||= el #O(1)
    if running.nil? || running < 0 #O(1)
      running = el #O(1)
    else
      running += el #O(1)
    end
    if largest < running #O(1)
      largest = running #O(1)
    end
  end
  largest #O(1)
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])


# def first_anagram?(str1, str2)
#   hash = Hash.new(0)
#   hash2 = Hash.new(0)
#   str1.each_char {|char| hash[char] += 1}
#   str2.each_char {|char| hash2[char] += 1}
#   hash == hash2
# end


def first_anagram?(str1, str2)
  str1.split("").permutation.to_a.map do |arr|
    arr.join
  end.include?(str2)
end


p first_anagram?("gizmobdfhksqrsgq", "sally")    #=> false
puts
p first_anagram?("elvis", "lives")    #=> true
