class WordGuess
  def initialize
    @words = {
      "e" => %w(dog cat bug hat cap lit kin fan fin fun tan ten tin ton),
      "m" => %w(plain claim brine crime alive bride skine drive slime stein jumpy),
      "h" => %w(
          machiavellian prestidigitation plenipotentiary quattuordecillion
          magnanimous unencumbered bioluminescent circumlocution
        )
    }

    @word = @words[set_mode].sample
    puts "Your word is #{ @word }"
  end

  def set_mode
    mode = ""
    until %w(e m h).include? mode
      print "\nThis can be (e)asy, (m)edium or really (h)ard. The choice is yours."
      mode = gets.chomp
    end

    mode
  end
end

WordGuess.new
