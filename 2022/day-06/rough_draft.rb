#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark 

def rough_draft
  File.open('2022/day-06/input.txt','r') { |f| f.gets.split('').each_cons(14).with_index { |set, i| abort((i + 14).to_s) if set.uniq.length == 14 } }
  # For part 2 just set 4 to 14
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  
  
  # Solutions: 
  #    part 1: 1702
  #    part 2: 3559
end
