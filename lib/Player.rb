class Player
  attr_reader :sign, :name
  attr_accessor :state, :inputs

  # get input
  # player configuration (customization)
  def initialize(name, sign)
    @name = name
    @sign = sign
    @inputs = []
    @state = false
  end

  def clear
    @inputs = []
  end
end
