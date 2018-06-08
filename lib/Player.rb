class Player
  attr_reader :sign, :name
  attr_accessor :state, :inputs

  # get input
  # player configuration (customization)
  def initialize(name, sign)
    raise MissingName if name.empty?
    raise MissingSign if sign.empty?
    @name = name
    @sign = sign
    @inputs = []
    @state = false
  end

  def clear
    @inputs = []
  end
end


class MissingName < StandardError
end

class MissingSign < StandardError
end
