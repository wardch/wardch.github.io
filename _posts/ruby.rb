ruby.rb

require_relative 'die.rb'

class RubyRacer
  attr_reader :players, :length

  def initialize(players, length = 30)
    @players = Hash.new(0)
    players.each {|player| @players[player] = 0}
    @length = length
  end

  def finished?
    @ahead = players.max_by do |k, v|
      v
    end

    @ahead[1] >= length
  end

  def winner
    if finished?
      @ahead[0]
    else
      nil
    end
  end

  def advance_player!(player)
    roll = Die.new.roll
    @players[player] += roll
  end

  def print_board
    clear_screen!
    length.times do |i|
      row = ".." * (players.keys.length + 3)
      players.each_with_index do |pair, index|
        row.insert(index * 2 + 1, pair[0]) if pair[1] == i
      end
      puts row
    end
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end
