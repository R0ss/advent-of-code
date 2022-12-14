#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark 

def rough_draft
  File.open('2022/day-01/input.txt','r') do |f|
      current_max = 0
      running_total = 0
      running_total_list = []
      while line = f.gets
        if line.strip.empty?
          current_max = [current_max, running_total].max
          running_total_list << running_total
          running_total = 0
        else
          running_total += line.to_i
        end
      end

      current_max = [current_max, running_total].max
      running_total_list << running_total
    

      puts current_max
      puts running_total_list.max(3).sum
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.001574   0.000087   0.001661 (  0.001657)
  
  # Solutions: 
  #    part 1: 68923
  #    part 2: 200044
end
