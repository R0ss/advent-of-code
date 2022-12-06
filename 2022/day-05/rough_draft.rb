#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark 

def rough_draft
  File.open('2022/day-05/input.txt','r') do |f|
      state_data = []
      state_mutations = []
      while line = f.gets
        
        state_data << line.split('').each_slice(4) if line.include?('[')
        state_mutations << line.split(' ').map(&:strip) if line.include?('move')
      end

      state_hash = {}
      state_hash.default = ""
      state_data.each_with_index{ |row, row_index| row.each_with_index { |column, column_index| state_hash["#{column_index+1}"] += column[1].strip } }
      
      state_mutations.each do |mutation| 
        state_hash[mutation[5]].prepend(state_hash[mutation[3]][0, mutation[1].to_i]) # Remove .reverse for part 2
        state_hash[mutation[3]] = state_hash[mutation[3]][mutation[1].to_i..]
        
      end

      puts state_hash.map {|_, v| v[0]}.join.to_s
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.003542   0.000084   0.003626 (  0.003626)
  
  # Solutions: 
  #    part 1: RFFFWBPNS
  #    part 2: CQQBBJFCS
end
