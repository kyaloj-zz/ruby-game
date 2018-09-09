# The awesome battalions
class Kingdom
  attr_reader :name, :soldiers, :wealth, :king
  def initialize(args)
    @name = args[:name]
    @king = args[:king]
    @soldiers = args[:soldiers]
    @wealth = args[:wealth]
  end

  def attack(opponent:, weapon:)
    weapon.fire
    opponent.demolish
  end

  def demolish
    @wealth.destroy
    # kill some soldiers
    [*1..4].sample.times { @soldiers -= 1 unless @soldiers.zero? }
    return unless @soldiers.zero?
    @king.capture
  end

  def status
    puts "King: #{@king.state}"
    puts "Soldiers: #{@soldiers}"
    puts "Wealth: #{@wealth.value} Gold Pieces"
  end
end
