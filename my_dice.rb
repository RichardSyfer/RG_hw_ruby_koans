def score(dice)
  return 0 if dice.empty?

  counts = Hash.new(0)

  dice.each{ |num| counts[num] += 1 }

  points = 0

  counts.each do |key, count|
    case
    when key == 1
      if (count <=> 3) == -1
        points += count * 100
      elsif (count <=> 3) == 0
        points += 1000
      else
        count -= 3
        points += (1000 + (count * 100))
      end

    when key == 2
      points += 100 * key if count >= 3

    when key == 3
      points += 100 * key if count >= 3

    when key == 4
      points += 100 * key if count >= 3

    when key == 5
      if (count <=> 3) == -1
        points += count * 50
      elsif (count <=> 3) == 0
        points += 500
      else
        count -= 3
        points += (500 + (count * 50))
      end
    when key == 6
      points += 100 * key if count >= 3
    end
  end
  return points
end

# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
p score([1,1,1,5,1])
p score([2,3,4,6,2])
p score([3,4,5,3,3])
p score([1,5,1,2,4])
