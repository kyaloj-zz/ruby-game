# The money
class Wealth
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def destroy
    # Assumed to be in a wooden cart in the battle field
    destruction = %w[high medium].sample
    @value /= destruction == 'high' ? 2 : 8 # destroy by half or just an 8th.
  end
end
