class Integer
  def to_bottle
    Bottle.for(self)
  end
end


class BottleSong
  def song
    verses(99,0)
  end

  def verses(max, min)
    max.downto(min).map do |i|
      verse(i)
    end.join("\n")
  end

  def verse(number)
    bottle = number.to_bottle
    next_bottle = bottle.succ
    "#{bottle.amount.capitalize} #{bottle.plural} of beer on the wall, " +
    "#{bottle.amount} #{bottle.plural} of beer.\n" +
    "#{bottle.action}, " +
    "#{next_bottle.amount} #{next_bottle.plural} of beer on the wall.\n"
  end

end

class Bottle
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def Bottle.for(number)
    case number
    when 0
      Bottle0.new(number)
    when 1
      Bottle1.new(number)
    else
      Bottle.new(number)
    end
  end

  def succ
    (number - 1).to_bottle
  end

  def action
    "Take #{how_many} down and pass it around"
  end

  def how_many
    "one"
  end

  def amount
    number.to_s
  end

  def plural
    "bottles"
  end
end

class Bottle0 < Bottle
  def amount
    "no more"
  end
  def action
    "Go to the store and buy some more"
  end
  def succ
    99.to_bottle
  end
end

class Bottle1 < Bottle
  def plural
    "bottle"
  end
  def how_many
    "it"
  end
end
