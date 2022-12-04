#!/usr/bin/env ruby

require 'benchmark'
include Benchmark 

def day_04_puzzle_1
  File.open('test/controllers/internal/input copy.txt','r') do |f|
      list_of_lists = []
      while line = f.gets
        list_of_lists << line.split(Regexp.union([',', '-'])).map(&:to_i)
      end

      puts list_of_lists.filter{ |lst| lst[0] == lst.sort[0] && lst[1] == lst.sort[3] || 
                                       lst[2] == lst.sort[0] && lst[3] == lst.sort[3] }.length

      puts list_of_lists.reject{ |lst| lst[1] < lst[2] || lst[3] < lst[0] }.length
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { day_04_puzzle_1 }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.010909   0.000339   0.011248 (  0.011254)
  
  # Solutions: 
  #    part 1: 538
  #    part 2: 792
end
