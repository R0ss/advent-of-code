#!/usr/bin/env ruby

# Come up with a quick solution to satisfy the requirements
# as rapidly as possible! Ruby is great for this :)

require 'benchmark'
include Benchmark 

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

def get_player_move(player, opponent)
  return 'z' if player == 'x' && opponent == 'a'
  return 'x' if player == 'y' && opponent == 'a'
  return 'y' if player == 'z' && opponent == 'a'

  return player if opponent == 'b'

  return 'y' if player == 'x' && opponent == 'c'
  return 'z' if player == 'y' && opponent == 'c'
  return 'x' if player == 'z' && opponent == 'c'
end

def rough_draft
  File.open('2022/day-02/input.txt','r') do |f|
      score_part_1 = 0
      score_part_2 = 0
      while line = f.gets
        playersActions = line.split(' ')

        player = playersActions[1].downcase
        opponent = playersActions[0].downcase

        score_part_1 += calculateScore(player, opponent)
        score_part_2 += calculateScore(get_player_move(player, opponent), opponent)
      end

      puts score_part_1
      puts score_part_2
    end
end

if __FILE__ == $0
  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    report = x.report("Performance") { rough_draft }
  end
  
  # Performance     user     system      total        real
  # (in seconds)  0.004155   0.000234   0.004389 (  0.004618)
  
  # Solutions: 
  #    part 1: 13809
  #    part 2: 12316
end
