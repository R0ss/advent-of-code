#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark 

def rough_draft
  File.open('2022/day-07/input.txt','r') do |f|

      curr_dir = []
      sizes = {}
      sizes.default = 0;

      while ln = f.gets&.split(' ')
        curr_dir = ['~'] if ln == ['$', 'cd', '/']
        curr_dir.pop if ln == ['$', 'cd', '..']
        curr_dir << ln[2] if (ln - ['/', '..']).length > 2

        curr_dir.length.times { |i| sizes[curr_dir[0, i+1].join] += ln[0].to_i } if ln[0].to_i.is_a? Numeric
      end

      p sizes.values.reject {|v| v > 100000}.sum
      p sizes.values.reject {|v| sizes['~'] - 40000000 > v}.sort.first
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.007086   0.000262   0.007348 (  0.007410)
  
  # Solutions: 
  #    part 1: 1770595
  #    part 2: 2195372
end
