#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark

def get_matching_char(set_a, set_b)
  set_a.each { |x| set_b.each { |y| return y if x == y } }
end

def get_matching_char_from_set(set_a, set_b, set_c)
  set_a.split('').each { |x| set_b.split('').each { |y| set_c.split('').each { |z| return z if x == y && y == z } } }
end

def rough_draft
  File.open('2022/day-03/input.txt','r') do |f|
      sum = []
      data = []
      while line = f.gets
        first, second = line.chars.each_slice(line.length / 2).map(&:join)
        extra_char = get_matching_char(first.split(''), second.split(''))
        sum << extra_char
        
        data << line
      end

      puts sum.flatten.map{ |x| x.ord - (x.ord < 'a'.ord ? 38 : 96) }.sum
      puts data.each_slice(3).to_a.map { |a, b, c| get_matching_char_from_set(a, b, c)}.flatten.map{ |x| x.ord - (x.ord < 'a'.ord ? 38 : 96) }.sum
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.204840   0.000794   0.205634 (  0.206458)
  
  # Solutions: 
  #    part 1: 8298
  #    part 2: 2708
end
