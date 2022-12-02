#!/usr/bin/env ruby

require 'benchmark'
include Benchmark 

# TODO: Spend more than 10 mins on a TDD solution!
def playerWins(player, opponent)
  return true if player == 'x' && opponent == 'c'
  return true if player == 'y' && opponent == 'a'
  return true if player == 'z' && opponent == 'b'
  false
end

def playerTies(player, opponent)
  return true if player == 'x' && opponent == 'a'
  return true if player == 'y' && opponent == 'b'
  return true if player == 'z' && opponent == 'c'
  false
end

def calculateScore(player, opponent)
  totalScore = 0
  totalScore += 1 if player == 'x'
  totalScore += 2 if player == 'y'
  totalScore += 3 if player == 'z'

  totalScore += 3 if playerTies(player, opponent)
  totalScore += 6 if playerWins(player, opponent)

  totalScore
end

def day_02_rock_paper_scissors
  File.open('input.txt','r') do |f|
      score = 0
      while line = f.gets
        playersActions = line.split(' ')
        score += calculateScore(playersActions[1].downcase, playersActions[0].downcase)
      end

      puts score
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { day_02_rock_paper_scissors }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.004155   0.000234   0.004389 (  0.004618)
  
  # Solutions: 
  #    part 1: 13809
  #    part 2: 
end
