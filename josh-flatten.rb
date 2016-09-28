#!/usr/bin/env ruby

Array.class_eval {
  def squarsh
    return self if empty?

    element = self.pop
    if element.is_a?(Array)
      self.squarsh + element.squarsh
    else
      self.squarsh << element
    end
  end
}

puts <<-text
  ===========================================
  ================ TESTING ==================
text

arrays_to_test = [
  [1,2,3,4],
  [1,[2,3]],
  [[]],
  [[1],[[2]],[[[3]]],[[[[4]]]],[[[[[5]]]]]]
]

arrays_to_test.each do |array|
  dup   = array.dup
  right = array.flatten
  test  = dup.squarsh

  puts "TEST: #{ test } should be equal to #{ right }?"
  puts (right == test ? "\033[42mPass\033[0m" : "\033[41mFail\033[0m")
end

puts <<-text
  =============== END TEST ==================
  ===========================================
text
