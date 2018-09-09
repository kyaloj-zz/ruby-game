# Bad idea for him to be captured
class King
  attr_reader :state
  def initialize(name)
    @name = name
    @state = 'attacking'
  end

  def capture
    @state = 'captured'
  end

  def in_battle?
    @state == 'attacking'
  end
end
