require './kingdom'
require './king'
require './wealth'
require './trebuchet'

# The war zone
class Battle
  def initialize
    puts <<-INTRODUCTION
    welcome to game of thrones. Attack your opponent Kingdom knowns as supermen.kill all soldiers and capture king.
    Once all soldiers are dead, you will capture king automatically and win.

    INTRODUCTION
  end

  def launch
    setup_battle_field
    run_battle
    print_results
  end

  def setup_battle_field
    puts 'What name do you want for your kingdom?'
    name = gets.chomp

    return puts 'Name is required' if name.empty?

    @attacking_kingdom = @mighty_kingdom = Kingdom.new(
      name: name,
      king: King.new('mighty King'),
      soldiers: 10,
      wealth: Wealth.new(1_000_000)
    )
    @recieving_kingdom = @opponent = Kingdom.new(
      name: 'supermen',
      king: King.new('super King'),
      soldiers: 10,
      wealth: Wealth.new(1_000_000)
    )
    @weapon = Trebuchet.new
    puts ''
  end

  def run_battle
    while @attacking_kingdom.wealth.value > 1
      puts ''
      puts "#{@attacking_kingdom.name} attacks #{@recieving_kingdom.name}"
      @attacking_kingdom.attack(opponent: @recieving_kingdom, weapon: @weapon)
      break unless @recieving_kingdom.king.in_battle? # stop game once king captured
      @attacking_kingdom, @recieving_kingdom = @recieving_kingdom, @attacking_kingdom
    end
  end

  def print_results
    puts ''
    puts '=' * 35
    puts ''

    [@mighty_kingdom, @opponent].each do |kingdom|
      puts "#{kingdom.name.upcase} STATUS"
      puts kingdom.status
      puts ''
    end

    puts "#{winner.upcase} WON THE BATTLE"
    puts '=' * 35
    puts ''
  end

  def winner
    if @mighty_kingdom.king.in_battle?
      @mighty_kingdom.name
    elsif @opponent.king.in_battle?
      @opponent.name
    else
      'None'
    end
  end
end

Battle.new.launch
