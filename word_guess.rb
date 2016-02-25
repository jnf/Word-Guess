class WordGuess
  def initialize
    # possible words, selected at random
    @words = {
      "e" => %w(dog cat bug hat cap lit kin fan fin fun tan ten tin ton),
      "m" => %w(plain claim brine crime alive bride skine drive slime stein jumpy),
      "h" => %w(
          machiavellian prestidigitation plenipotentiary quattuordecillion
          magnanimous unencumbered bioluminescent circumlocution
        )
    }

    # players attempts allowed by difficulty
    @tries = {
      "e" => 10,
      "m" => 6,
      "h" => 4
    }

    # ask the user to set the game mode
    mode = set_mode

    @word    = @words[mode].sample # chosen word; players try to guess this
    @guesses = @tries[mode] # how many tries the player gets

    # debugging for now
    puts "Your word is #{ @word }. You have #{ @guesses } guesses."
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
