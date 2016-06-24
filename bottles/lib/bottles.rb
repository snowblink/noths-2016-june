class Bottles
  def song
    verses(99,0)
  end

  def verses(max, min)
    max.downto(min).map do |i|
      verse(i)
    end.join("\n")
  end

  def verse(number)
    "#{amount(number).capitalize} #{plural(number)} of beer on the wall, " +
    "#{amount(number)} #{plural(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{number_of_bottles(succ(number))} #{plural(number - 1)} of beer on the wall.\n"
  end

  def succ(number)
    if number == 0
      99
    else
      number - 1
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{how_many(number)} down and pass it around"
    end
  end

  def amount(number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def plural(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def number_of_bottles(number)
    if number == 0
      "no more"
    else
      number
    end
  end

  def how_many(number)
    if number == 1
      "it"
    else
      "one"
    end
  end
end
