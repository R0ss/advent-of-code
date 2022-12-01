#!/usr/bin/env ruby

if __FILE__ == $0
  File.open("input.txt",'r') do |f|
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
      running_total_list << running_total unless running_total.zero?
    

      puts current_max
      puts running_total_list.max(3).sum
    end
end
